import SwiftUI
import ComposableArchitecture
import TunerFeature

struct AppView_macOS: View {
  let store: Store<AppState, AppAction>
  @State var navlink = Optional<Int>(0)
  
  var body: some View {
    WithViewStore(store) { viewStore in
      NavigationView {
        List {
          NavigationLink(
            tag: 0,
            selection: $navlink,
            destination: { TunerView(store: store.scope(state: \.tuner, action: AppAction.tuner)) },
            label: { Label("Tune", systemImage: "music.note.list") }
          )
          NavigationLink(
            tag: 1,
            selection: $navlink,
            destination: { AboutView(store: store) },
            label: { Label("About", systemImage: "gear") }
          )
        }
        .listStyle(.sidebar)
        .toolbar {
          ToolbarItemGroup(placement: .navigation) {
            Button(action: toggleSidebar) {
              Label("Sidebar", systemImage: "sidebar.left")
            }
          }
        }
      }
//      .frame(width: 525, height: 375)
      .frame(width: 550, height: 400)
      
    }
  }
}

struct AboutView: View {
  let store: Store<AppState, AppAction>
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text("About")
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

func toggleSidebar() {
  NSApp
    .keyWindow?
    .firstResponder?
    .tryToPerform(#selector(NSSplitViewController.toggleSidebar), with: nil)
}


struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    AppView_macOS(store: AppState.defaultStore)
  }
}
