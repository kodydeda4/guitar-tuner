import SwiftUI
import ComposableArchitecture

struct InfoView_iOS: View {
  let store: Store<InfoState, InfoAction>
  
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
      .navigationTitle("Information")
    }
  }
}

struct InfoView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    InfoView_iOS(store: InfoState.defaultStore)
  }
}
