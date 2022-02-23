#if os(macOS)
import SwiftUI
import ComposableArchitecture

struct InfoView_macOS: View {
  let store: Store<InfoState, InfoAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      List {
        Section("Author") {
          Text(viewStore.author)
        }
        Section("Purpose") {
          Text(viewStore.appDescription)
        }
      }
      .navigationTitle("Information")
      .toolbar {
        Link(
          "Read More",
          destination: viewStore.projectURL
        )
      }
    }
  }
}

struct InfoView_macOS_Previews: PreviewProvider {
  static var previews: some View {
    InfoView_macOS(store: InfoState.defaultStore)
  }
}
#endif
