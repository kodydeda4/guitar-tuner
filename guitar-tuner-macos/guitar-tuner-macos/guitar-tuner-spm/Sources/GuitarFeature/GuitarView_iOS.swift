import SwiftUI
import ComposableArchitecture
import Models

struct GuitarView_iOS: View {
  let store: Store<GuitarState, GuitarAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        HStack {
          ForEach(viewStore.tuning.notes) { note in
            Button(note.description) {
              viewStore.send(.play(note))
            }
          }
        }
        .buttonStyle(.plain)
        
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

struct GuitarViewiOS_Previews: PreviewProvider {
  static var previews: some View {
    GuitarView_iOS(store: GuitarState.mockStore)
  }
}
