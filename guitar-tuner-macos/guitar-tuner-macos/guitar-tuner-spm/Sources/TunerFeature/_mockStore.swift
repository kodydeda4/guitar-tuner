import ComposableArchitecture

extension TunerState {
  static let mockStore = Store(
    initialState: TunerState(
      instrument: .guitar,
      tuning: .eStandard
    ),
    reducer: tunerReducer,
    environment: TunerEnvironment(
      mainQueue: .main,
      guitarClient: .live
    )
  )
}
