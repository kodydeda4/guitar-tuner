import SwiftUI
import ComposableArchitecture
import GuitarFeature

struct AppView_macOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      GuitarView(store: store.scope(
        state: \.guitar,
        action: AppAction.guitar
      ))
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    AppView_macOS(store: AppState.defaultStore)
  }
}
