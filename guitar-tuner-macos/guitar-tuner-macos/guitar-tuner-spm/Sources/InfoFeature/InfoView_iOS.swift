import SwiftUI
import ComposableArchitecture

struct InfoView_iOS: View {
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

struct InfoView_iOS_Previews: PreviewProvider {
  static var previews: some View {
    InfoView_iOS(store: InfoState.defaultStore)
  }
}
