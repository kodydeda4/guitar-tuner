import SwiftUI
import SwiftUINavigation
import ComposableArchitecture
import TunerFeature
import AboutFeature

struct AppView_iOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      TabView(selection: viewStore.binding(\.$route)) {
        TunerView(store: store.scope(state: \.tuner, action: AppAction.tuner))
          .navigationView()
          .tag(AppState.Route.tuner)
          .tabItem { Label("Tune", systemImage: "music.note.list") }
        
        AboutView(store: store.scope(state: \.about, action: AppAction.about))
          .navigationTitle("About")
          .navigationView()
          .tag(AppState.Route.about)
          .tabItem { Label("About", systemImage: "gear") }
      }
    }
  }
}

struct AppView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    AppView_iOS(store: AppState.defaultStore)
  }
}
