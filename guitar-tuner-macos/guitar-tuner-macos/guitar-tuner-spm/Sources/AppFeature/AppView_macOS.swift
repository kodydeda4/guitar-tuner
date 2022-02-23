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
        List(selection: viewStore.binding(\.$route)) {
          NavigationLink(
            destination: {
              TunerView(store: store.scope(
                state: \.tuner,
                action: AppAction.tuner
              ))
            },
            label: {
              Label("Tune", systemImage: "music.note.list")
            }
          ).tag(AppState.Route.tuner)
          
          NavigationLink(
            destination: {
              InfoView(store: store.scope(
                state: \.info,
                action: AppAction.info
              ))
            },
            label: {
              Label("Info", systemImage: "gear")
            }
          ).tag(AppState.Route.info)
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
