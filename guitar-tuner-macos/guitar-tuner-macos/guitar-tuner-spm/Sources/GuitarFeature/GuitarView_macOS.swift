import SwiftUI
import ComposableArchitecture
import Models

struct GuitarView_macOS: View {
  let store: Store<GuitarState, GuitarAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Image("guitar")
          .resizable()
          .scaledToFit()
          .foregroundColor(.pink)
        
        HStack {
          ForEach(viewStore.tuning.notes) { note in
            Button(note.description) {
              viewStore.send(.play(note))
            }
          }
        }
        .padding()
      }
      .frame(width: 400, height: 400)
      .navigationTitle("GuitarTuner")
      .toolbar {
        Picker("Tuning", selection: viewStore.binding(\.$tuning)) {
          ForEach(GuitarTuning.allCases) { tuning in
            Text(tuning.rawValue)
              .tag(tuning)
          }
        }
      }
    }
  }
}

struct GuitarView_macOS_Previews: PreviewProvider {
  static var previews: some View {
    GuitarView_macOS(store: GuitarState.mockStore)
  }
}
