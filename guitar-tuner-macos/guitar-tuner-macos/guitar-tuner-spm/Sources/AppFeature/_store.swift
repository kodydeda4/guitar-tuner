import ComposableArchitecture
import TunerFeature
import InfoFeature
import Models

public extension Store where State == AppState, Action == AppAction {
  static let live = Store(
    initialState: AppState(
      tuner: TunerState(),
      info: InfoState(),
      route: AppState.Route.tuner
    ),
    reducer: appReducer,
    environment: AppEnvironment(
      mainQueue: .main,
      guitarClient: .live
    )
  )
}
