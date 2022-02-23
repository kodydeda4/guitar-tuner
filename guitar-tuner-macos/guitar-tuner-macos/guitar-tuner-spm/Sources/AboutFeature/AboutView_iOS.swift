import SwiftUI
import ComposableArchitecture

struct AboutView_iOS: View {
  let store: Store<AboutState, AboutAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text("Author: \(viewStore.author)")
        Text("This is the iOS version btw...")
          .font(.caption)
        
        Button("Github") {
          ///....
        }
        Button("LinkedIn") {
          ///....
        }

      }
      .navigationTitle("About")
    }
  }
}

struct AboutView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    AboutView_iOS(store: AboutState.defaultStore)
  }
}

