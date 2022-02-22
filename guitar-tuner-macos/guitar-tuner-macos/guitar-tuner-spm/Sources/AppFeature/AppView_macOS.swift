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
            destination: {
              TunerView(store: store.scope(
                state: \.tuner,
                action: AppAction.tuner
              ))
            },
            label: {
              Label(
                "Tune",
                systemImage: "music.note.list"
              )
            }
          )
          NavigationLink(
            tag: 1,
            selection: $navlink,
            destination: {
              VStack {
                Text("About")
              }
              .navigationTitle("About")
              .toolbar {
                Button("Github") {
                  ///....
                }
              }
            },
            label: {
              Label(
                "About",
                systemImage: "gear"
              )
            }
          )
        }
        .listStyle(.sidebar)
      }
      .frame(width: 700, height: 300)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    AppView_macOS(store: AppState.defaultStore)
  }
}
