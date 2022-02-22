import Models
import ComposableArchitecture
import GuitarClient
import GuitarFeature

public struct AppState: Equatable {
  public var guitar = GuitarState(instrument: .guitar, tuning: .eStandard)
}

public enum AppAction: Equatable {
  case guitar(GuitarAction)
}

public struct AppEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  public let guitarClient: GuitarClient
  
  public init(
    mainQueue: AnySchedulerOf<DispatchQueue>,
    guitarClient: GuitarClient
  ) {
    self.mainQueue = mainQueue
    self.guitarClient = guitarClient
  }
}

public let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  guitarReducer.pullback(
    state: \.guitar,
    action: /AppAction.guitar,
    environment: {
      GuitarEnvironment(
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


public extension AppState {
  static let defaultStore = Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnvironment(
      mainQueue: .main,
      guitarClient: .live
    )
  )
}
