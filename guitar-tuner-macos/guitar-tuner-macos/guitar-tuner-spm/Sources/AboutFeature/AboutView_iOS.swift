import SwiftUI
import ComposableArchitecture

struct AboutView_iOS: View {
  let store: Store<AboutState, AboutAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text("About \(viewStore.author) iOS")
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

struct AboutView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    AboutView_iOS(store: AboutState.defaultStore)
  }
}

