#if os(watchOS)
import SwiftUI
import ComposableArchitecture
import Models

struct TunerView_watchOS: View {
  let store: Store<TunerState, TunerAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      ScrollView {
        NavigationPicker(
          title: "Instrument",
          options: Instrument.allCases,
          selection: viewStore.binding(\.$instrument)
        )
        NavigationPicker(
          title: "Tuning",
          options: InstrumentTuning.allCases,
          selection: viewStore.binding(\.$tuning)
        )
        NavigationLink("Play") {
          ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
              ForEach(viewStore.notes) { note in
                Button(note.description.prefix(1)) {
                  viewStore.send(.play(note))
                }
              }
            }
          }
          .navigationTitle("\(viewStore.tuning.rawValue)")
        }
        .tint(.blue)
      }
      .navigationTitle("Tune")
    }
  }
}

struct NavigationPicker<SelectionValue>: View
where SelectionValue : Hashable,
      SelectionValue: CustomStringConvertible {
  let title: String
  let options: [SelectionValue]
  @Binding var selection: SelectionValue
  
  var body: some View {
    NavigationLink(selection.description) {
      List {
        Picker(title, selection: $selection) {
          ForEach(options, id: \.self) {
            Text($0.description).tag($0)
          }
        }
        .pickerStyle(InlinePickerStyle())
      }
    }
  }
}

struct TunerView_watchOS_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TunerView_watchOS(store: TunerState.mockStore)
    }
  }
}
#endif
