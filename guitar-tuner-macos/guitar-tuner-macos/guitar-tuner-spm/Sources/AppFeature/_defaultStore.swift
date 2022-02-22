import ComposableArchitecture

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
