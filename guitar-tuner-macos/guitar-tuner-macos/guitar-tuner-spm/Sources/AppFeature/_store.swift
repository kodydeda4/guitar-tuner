import ComposableArchitecture

public extension AppState {
  static let defaultStore = Store(
    initialState: AppState(),
    reducer: appReducer,
    environment: .live
  )
}
