#if os(iOS)
import SwiftUI
import ComposableArchitecture
import Models

struct TunerView_iOS: View {
  let store: Store<TunerState, TunerAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Form {
        Section {
          Image(viewStore.instrument.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 175)
            .padding()
            .background(GroupBox { Color.clear })
            .clipShape(Circle())
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            .padding(.top)
        }
        Section {
          Picker("Instrument", selection: viewStore.binding(\.$instrument)) {
            ForEach(Instrument.allCases) {
              Text($0.rawValue).tag($0)
            }
          }
          Picker("Tuning", selection: viewStore.binding(\.$tuning)) {
            ForEach(InstrumentTuning.allCases) {
              Text($0.rawValue).tag($0)
            }
          }
        }
        Section {
          HStack {
            ForEach(viewStore.notes) { note in
              Button(action: { viewStore.send(.play(note)) }) {
                GroupBox {
                  Text(note.description.prefix(1))
                    .frame(maxWidth: .infinity)
                }
              }
            }
          }
        }
        .buttonStyle(.plain)
        .listRowBackground(Color.clear)
      }
      .listStyle(.inset)
      .navigationTitle("\(viewStore.instrument.rawValue) Tuner")
    }
  }
}

struct GuitarViewiOS_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TunerView_iOS(store: TunerState.mockStore)
    }
  }
}
#endif
