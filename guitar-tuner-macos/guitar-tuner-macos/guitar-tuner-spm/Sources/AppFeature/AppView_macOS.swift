import SwiftUI
import SwiftUINavigation
import ComposableArchitecture
import TunerFeature
import InfoFeature

struct AppView_macOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        List {
          NavigationLink(
            tag: AppState.Route.tuner,
            selection: viewStore.binding(\.$route),
            destination: { TunerView(store: store.scope(state: \.tuner, action: AppAction.tuner)) },
            label: { Label("Tune", systemImage: "music.note.list") }
          )
          NavigationLink(
            tag: AppState.Route.info,
            selection: viewStore.binding(\.$route),
            destination: { InfoView(store: store.scope(state: \.info, action: AppAction.info)) },
            label: { Label("Info", systemImage: "gear") }
          )
        }
      }
      .listStyle(.sidebar)
      .frame(width: 550, height: 400)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    AppView_macOS(store: AppState.defaultStore)
  }
}
