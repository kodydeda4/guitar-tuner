import Models
import ComposableArchitecture
import TunerClient
import TunerFeature

public struct AppState: Equatable {
  public var tuner = TunerState(
    instrument: .guitar,
    tuning: .eStandard
  )
}

public enum AppAction: Equatable {
  case tuner(TunerAction)
}

public struct AppEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let tunerClient: TunerClient
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    guitarClient: TunerClient
  ) {
    self.mainQueue = mainQueue
    self.tunerClient = guitarClient
  }
}

public let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  tunerReducer.pullback(
    state: \.tuner,
    action: /AppAction.tuner,
    environment: {
      TunerEnvironment(
        mainQueue: $0.mainQueue,
        tunerClient: $0.tunerClient
      )
    }
  ),
  Reducer { state, action, environment in
    switch action {
      
    case .tuner:
      return .none
    }
  }
)


