import Models
import ComposableArchitecture
import TunerClient
import TunerFeature
import AboutFeature

public struct AppState: Equatable {
  public var about = AboutState()
  public var tuner = TunerState()
}

public enum AppAction: Equatable {
  case about(AboutAction)
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
  aboutReducer.pullback(
    state: \.about,
    action: /AppAction.about,
    environment: { _ in () }
  ),
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
      
    case .about:
      return .none
      
    case .tuner:
      return .none
    }
  }
)


