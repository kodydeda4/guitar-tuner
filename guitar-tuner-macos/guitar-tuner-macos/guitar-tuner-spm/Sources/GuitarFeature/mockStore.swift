import ComposableArchitecture

extension GuitarState {
  static let mockStore = Store(
    initialState: GuitarState(
      instrument: .guitar,
      tuning: .eStandard
    ),
    reducer: guitarReducer,
    environment: GuitarEnvironment(
      mainQueue: .main,
      guitarClient: .live
    )
  )
}
