import SwiftUI
import ComposableArchitecture

struct InfoView_watchOS: View {
  let store: Store<InfoState, InfoAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      List {
        Section("About me") {
          Text("Author: \(viewStore.author)")
          Text("This is the watchOS view btw...")
            .font(.caption)
        }
        Section("Links") {
          Button("Github") {
            
          }
          Button("LinkedIn") {
            
          }
        }
      }
      .navigationTitle("Information")
    }
  }
}

struct InfoView_watchOS_Previews: PreviewProvider {
  static var previews: some View {
    InfoView_watchOS(store: InfoState.defaultStore)
  }
}
