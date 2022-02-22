import SwiftUI
import ComposableArchitecture
import Models

struct TunerView_macOS: View {
  let store: Store<TunerState, TunerAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      HStack {
        Image(viewStore.instrument.rawValue)
          .resizable()
          .scaledToFit()
          .frame(width: 175)
        
        HStack {
          ForEach(viewStore.notes) { note in
            Button(action: { viewStore.send(.play(note)) }) {
              GroupBox {
                Text(note.description.prefix(1))
                  .padding()
              }
            }
            .buttonStyle(.plain)
          }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
      }
      .navigationTitle("\(viewStore.instrument.rawValue) Tuner")
      .toolbar {
        Picker("Instrument", selection: viewStore.binding(\.$instrument)) {
          ForEach(Instrument.allCases) {
            Text($0.rawValue).tag($0)
          }
        }
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
