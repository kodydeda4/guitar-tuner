import ComposableArchitecture

public struct AppState: Equatable {
  public var text = "Hello, AppState"
}

public enum AppAction: Equatable {
  case updateText
}

public struct AppEnvironment {
  public let mainQueue: AnySchedulerOf<DispatchQueue>
  
  public init(mainQueue: AnySchedulerOf<DispatchQueue>) {
    self.mainQueue = mainQueue
  }
}

public let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
  switch action {
    
  case .updateText:
    state.text = "Was updated"
    return .none
  }
}

public extension AppState {
  static let defaultStore = Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: AppEnvironment(
      mainQueue: .main
    )
  )
}



