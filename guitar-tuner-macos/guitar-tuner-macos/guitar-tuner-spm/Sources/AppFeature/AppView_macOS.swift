import SwiftUI
import ComposableArchitecture
import TunerFeature

struct AppView_macOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      TunerView(store: store.scope(
        state: \.tuner,
        action: AppAction.tuner
      ))
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    AppView_macOS(store: AppState.defaultStore)
  }
}
