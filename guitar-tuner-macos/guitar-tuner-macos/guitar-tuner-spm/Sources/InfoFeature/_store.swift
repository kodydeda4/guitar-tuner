import ComposableArchitecture

public extension InfoState {
  static let defaultStore = Store(
    initialState: InfoState(),
    reducer: infoReducer,
    environment: ()
  )
}


