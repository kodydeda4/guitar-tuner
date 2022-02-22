import Models
import ComposableArchitecture
import TunerClient
import TunerFeature

public struct AppState: Equatable {
  public var guitar = TunerState(
    instrument: .guitar,
    tuning: .eStandard
  )
}

public enum AppAction: Equatable {
  case guitar(TunerAction)
}

public struct AppEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let guitarClient: TunerClient
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    guitarClient: TunerClient
  ) {
    self.mainQueue = mainQueue
    self.guitarClient = guitarClient
  }
}

public let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  tunerReducer.pullback(
    state: \.guitar,
    action: /AppAction.guitar,
    environment: {
      TunerEnvironment(
        mainQueue: $0.mainQueue,
        guitarClient: $0.guitarClient
      )
    }
  ),
  Reducer { state, action, environment in
    switch action {
      
    case .guitar:
      return .none
    }
  }
)


