import SwiftUI
import ComposableArchitecture
import Models

struct TunerView_macOS: View {
  let store: Store<TunerState, TunerAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Rectangle()
          .frame(width: 500)

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
          ForEach(InstrumentTuning.allCases) { tuning in
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
    TunerView_macOS(store: TunerState.mockStore)
  }
}
