import ComposableArchitecture

extension Store where State == InfoState, Action == InfoAction {
  static let live = Store(
    initialState: InfoState(),
    reducer: infoReducer,
    environment: ()
  )
}
