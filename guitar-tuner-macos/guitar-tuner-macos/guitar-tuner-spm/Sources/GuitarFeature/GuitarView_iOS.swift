import SwiftUI
import ComposableArchitecture
import Models

struct GuitarView_iOS: View {
  let store: Store<GuitarState, GuitarAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      Form {
        Section {
          Image("guitar")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .padding()
            .background(
              GroupBox {
                Color.clear
              }
              .clipShape(Circle())
            )
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
        }
        
        Section {
          Picker("Instrument", selection: viewStore.binding(\.$instrument)) {
            ForEach(Instrument.allCases) {
              Text($0.rawValue)
                .tag($0)
            }
          }

          Picker("Tuning", selection: viewStore.binding(\.$tuning)) {
            ForEach(GuitarTuning.allCases) {
              Text($0.rawValue)
                .tag($0)
            }
          }
        }
        Section {
          HStack {
            ForEach(viewStore.tuning.notes) { note in
              Button(action: { viewStore.send(.play(note)) }) {
                GroupBox {
                  Text(note.description.prefix(1))
                    .frame(maxWidth: .infinity)
                }
              }
              .buttonStyle(.plain)
            }
          }
          .listRowBackground(Color.clear)
        }
      }
      .listStyle(.inset)
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
