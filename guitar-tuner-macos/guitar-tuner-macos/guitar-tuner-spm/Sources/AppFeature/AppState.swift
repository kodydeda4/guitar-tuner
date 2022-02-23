import Models
import ComposableArchitecture
import TunerClient
import TunerFeature
import AboutFeature

public struct AppState: Equatable {
  public var tuner = TunerState()
  public var about = AboutState()
  @BindableState public var route: Route? = .about
  
  public enum Route {
    case tuner
    case about
  }
}

public enum AppAction: BindableAction, Equatable {
  case binding(BindingAction<AppState>)
  case tuner(TunerAction)
  case about(AboutAction)
}

public struct AppEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let tunerClient: TunerClient
  
  public static let live = Self(
    mainQueue: .main,
    guitarClient: .live
  )
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
  aboutReducer.pullback(
    state: \.about,
    action: /AppAction.about,
    environment: { _ in () }
  ),

  Reducer { state, action, environment in
    switch action {
      
    case .binding, .tuner, .about:
      return .none
    }
  }.binding()
)


