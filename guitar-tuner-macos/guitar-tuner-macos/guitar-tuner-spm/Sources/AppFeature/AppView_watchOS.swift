#if os(watchOS)
import SwiftUI
import SwiftUINavigation
import ComposableArchitecture
import TunerFeature
import InfoFeature

struct AppView_watchOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        List {
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
        .navigationTitle("GuitarTuner")
      }
    }
  }
}

struct AppView_watchOS_Previews: PreviewProvider {
  static var previews: some View {
    AppView_watchOS(store: AppState.defaultStore)
  }
}
#endif
