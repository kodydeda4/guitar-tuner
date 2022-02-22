import SwiftUI
import ComposableArchitecture
import Models

struct GuitarView_iOS: View {
  let store: Store<GuitarState, GuitarAction>

  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        
        Text("Overview")
          .font(.headline)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        ContentView(store: store)
        .padding(.bottom)

        Text("Settings")
          .font(.headline)
          .frame(maxWidth: .infinity, alignment: .leading)

        NavLink(
          prompt: "Instrument",
          label: "Guitar",
          destination: { Text("Hi") }
        )

        NavLink(
          prompt: "Tuning",
          label: viewStore.tuning.rawValue,
          destination: { Text("Hi") }
        )

        Spacer()
      }
      .padding()
      .navigationTitle("GuitarTuner")
    }
  }
}

struct GuitarViewiOS_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GuitarView_iOS(store: GuitarState.mockStore)
    }
  }
}

struct ContentView: View {
  let store: Store<GuitarState, GuitarAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      HStack {
        VStack {
          ForEach(viewStore.tuning.notes.prefix(upTo: 3)) { note in
            Button(action: { viewStore.send(.play(note)) }) {
              GroupBox {
                Text(note.description.prefix(1))
                  .frame(maxWidth: .infinity)
              }
            }
            .buttonStyle(.plain)
          }
        }
        
        Image("guitar")
          .resizable()
          .scaledToFit()
          .frame(width: 200)
        
        VStack {
          ForEach(viewStore.tuning.notes.suffix(from: 3)) { note in
            Button(action: { viewStore.send(.play(note)) }) {
              GroupBox {
                Text(note.description.prefix(1))
                  .frame(maxWidth: .infinity)
              }
            }
            .buttonStyle(.plain)
          }
        }
      }
    }
  }
}


struct NavLink<Destination>: View where Destination: View {
  let prompt: String
  let label: String
  let destination: () -> Destination
  
  var body: some View {
    NavigationLink(destination: destination) {
      GroupBox {
        HStack {
          Text(prompt)
            .foregroundColor(.white)
          Spacer()
          Text(label)
            .bold()
            .foregroundColor(.gray)
          Image(systemName: "chevron.forward")
            .foregroundColor(.gray)
        }
      }
    }
  }
}
