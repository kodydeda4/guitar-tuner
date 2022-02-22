import ComposableArchitecture

public extension AboutState {
  static let defaultStore = Store(
    initialState: AboutState(
      author: "Kody Deda"
    ),
    reducer: aboutReducer,
    environment: ()
  )
}
