import ComposableArchitecture

public extension InfoState {
  static let defaultStore = Store(
    initialState: InfoState(
      author: "Kody Deda"
    ),
    reducer: infoReducer,
    environment: ()
  )
}
