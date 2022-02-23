#if os(watchOS)
import SwiftUI
import ComposableArchitecture
import Models

struct TunerView_watchOS: View {
  let store: Store<TunerState, TunerAction>
  
  var body: some View {
    WithViewStore(store) { viewStore in
      List {
        Image(viewStore.instrument.rawValue)
          .resizable()
          .scaledToFit()
        
        ForEach(viewStore.notes) { note in
          Button(note.description.prefix(1)) {
            viewStore.send(.play(note))
          }
        }
      }
      .navigationTitle("Tune")
      //      .toolbar {
      //        ToolbarItemGroup(placement: .automatic) {
      //          Picker("Instrument", selection: viewStore.binding(\.$instrument)) {
      //            ForEach(Instrument.allCases) {
      //              Text($0.rawValue).tag($0)
      //            }
      //          }
      //          Picker("Tuning", selection: viewStore.binding(\.$tuning)) {
      //            ForEach(InstrumentTuning.allCases) { tuning in
      //              Text(tuning.rawValue)
      //                .tag(tuning)
      //            }
      //          }
      //        }
      //      }
    }
  }
}

struct TunerView_watchOS_Previews: PreviewProvider {
  static var previews: some View {
    TunerView_watchOS(store: TunerState.mockStore)
  }
}
#endif
