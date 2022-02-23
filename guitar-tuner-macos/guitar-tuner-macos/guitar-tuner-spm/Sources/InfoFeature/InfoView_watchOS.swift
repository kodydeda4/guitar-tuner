import SwiftUI
import ComposableArchitecture

struct InfoView_watchOS: View {
  let store: Store<InfoState, InfoAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text("Author: \(viewStore.author)")
        Text("This is the macOS view btw...")
          .font(.caption)
      }
      .navigationTitle("Information")
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

struct InfoView_watchOS_Previews: PreviewProvider {
  static var previews: some View {
    InfoView_watchOS(store: InfoState.defaultStore)
  }
}
