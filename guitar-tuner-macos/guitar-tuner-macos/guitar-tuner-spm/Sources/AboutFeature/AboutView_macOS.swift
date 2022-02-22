import SwiftUI
import ComposableArchitecture

struct AboutView_macOS: View {
  let store: Store<AboutState, AboutAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text("About \(viewStore.author) macOS")
      }
      .navigationTitle("About")
      .toolbar {
        Button("Github") {
          ///....
        }
        Button("LinkedIn") {
          ///....
        }
      }
    }
  }
}

struct AboutView_macOS_Previews: PreviewProvider {
  static var previews: some View {
    AboutView_macOS(store: AboutState.defaultStore)
  }
}

