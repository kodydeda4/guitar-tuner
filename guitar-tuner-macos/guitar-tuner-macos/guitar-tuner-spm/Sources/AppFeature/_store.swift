import ComposableArchitecture
import TunerFeature
import InfoFeature
import Models

public extension AppState {
  static let defaultStore = Store(
    initialState: AppState(
      tuner: TunerState(),
      info: InfoState(),
      route: Route.tuner
    ),
    reducer: appReducer,
    environment: .live
  )
}
