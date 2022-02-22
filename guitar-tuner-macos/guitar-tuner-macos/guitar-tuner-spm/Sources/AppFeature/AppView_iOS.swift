import SwiftUI
import ComposableArchitecture
import TunerFeature

struct AppView_iOS: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      TabView {
        TunerView(store: store.scope(state: \.guitar, action: AppAction.guitar))
          .navigationView()
          .tag(0)
          .tabItem { Label("Tune", systemImage: "music.note.list") }
        
        VStack {
          Text("Kody Deda")
            .font(.title2)
            .bold()
            .foregroundColor(.gray)
            .opacity(0.5)
        }
        .navigationTitle("About")
        .navigationView()
        .tag(1)
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
