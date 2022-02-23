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
      TabView(selection: viewStore.binding(\.$route)) {
        TunerView(store: store.scope(state: \.tuner, action: AppAction.tuner))
          .navigationView()
          .tag(Optional(AppState.Route.tuner))
          .tabItem { Label("Tune", systemImage: "music.note.list") }
        
        InfoView(store: store.scope(state: \.info, action: AppAction.info))
          .navigationView()
          .tag(Optional(AppState.Route.info))
          .tabItem { Label("Info", systemImage: "gear") }
      }
    }
  }
}

struct AppView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    AppView_iOS(store: .init(
      initialState: .init(route: .tuner),
      reducer: appReducer,
      environment: .live
    ))
    
    AppView_iOS(store: .init(
      initialState: .init(route: .info),
      reducer: appReducer,
      environment: .live
    ))
  }
}
#endif
