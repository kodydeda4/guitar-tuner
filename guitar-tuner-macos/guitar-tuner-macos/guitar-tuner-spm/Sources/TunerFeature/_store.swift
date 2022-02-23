import ComposableArchitecture
import Models

extension Store where State == TunerState, Action == TunerAction {
  static let live = Store(
    initialState: TunerState(
      instrument: .guitar,
      tuning: .eStandard
    ),
    reducer: tunerReducer,
    environment: TunerEnvironment(
      mainQueue: .main,
      tunerClient: .live
    )
  )
}

