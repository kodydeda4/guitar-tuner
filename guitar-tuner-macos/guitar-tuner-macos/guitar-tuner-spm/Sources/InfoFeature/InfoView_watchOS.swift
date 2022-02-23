import SwiftUI
import ComposableArchitecture

struct InfoView_watchOS: View {
  let store: Store<InfoState, InfoAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      List {
        Section {
          Text(viewStore.author)
        } header: {
          Text("Author")
        } footer: {
          Text(viewStore.appDescription)
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
