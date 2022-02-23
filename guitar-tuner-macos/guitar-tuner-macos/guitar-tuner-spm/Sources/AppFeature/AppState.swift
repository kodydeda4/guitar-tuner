import Models
import ComposableArchitecture
import TunerClient
import TunerFeature
import InfoFeature

public struct AppState: Equatable {
  public var tuner: TunerState
  public var info: InfoState
  @BindableState public var route: Route?
  
  public enum Route {
    case tuner
    case info
  }
  
  public init(
    tuner: TunerState,
    info: InfoState,
    route: Route?
  ) {
    self.tuner = tuner
    self.info = info
    self.route = route
  }
}

public enum AppAction: BindableAction, Equatable {
  case binding(BindingAction<AppState>)
  case tuner(TunerAction)
  case info(InfoAction)
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

public let appReducer = Reducer<
  AppState,
  AppAction,
  AppEnvironment
>.combine(
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
  infoReducer.pullback(
    state: \.info,
    action: /AppAction.info,
    environment: { _ in () }
  )
).binding().debug()





