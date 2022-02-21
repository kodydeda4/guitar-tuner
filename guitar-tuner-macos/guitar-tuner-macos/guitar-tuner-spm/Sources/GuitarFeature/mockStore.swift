import ComposableArchitecture

extension GuitarState {
  static let mockStore = Store(
    initialState: GuitarState(
      tuning: .eStandard
    ),
    reducer: guitarReducer,
    environment: GuitarEnvironment(
      mainQueue: .main,
      guitarClient: .live
    )
  )
}
