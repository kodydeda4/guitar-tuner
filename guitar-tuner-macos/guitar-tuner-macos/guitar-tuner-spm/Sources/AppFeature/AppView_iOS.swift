#if os(iOS)
import SwiftUI
import SwiftUINavigation
import ComposableArchitecture
import TunerFeature
import InfoFeature

struct AppView_iOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      TabView(
        selection: viewStore.binding(\.$route)
      ) {
        TunerView
          .init(store: store.scope(
            state: \.tuner,
            action: AppAction.tuner
          ))
          .navigationView()
          .tabItem { Label("Tune", systemImage: "music.note.list") }
          .tag(Optional(AppState.Route.tuner))
        
        InfoView
          .init(store: store.scope(
            state: \.info,
            action: AppAction.info
          ))
          .navigationView()
          .tabItem { Label("Info", systemImage: "gear") }
          .tag(Optional(AppState.Route.info))
      }
    }
  }
}

struct AppView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    AppView_iOS(store: .live)
  }
}
#endif
