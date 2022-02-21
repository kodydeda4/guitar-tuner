import SwiftUI
import ComposableArchitecture
import Models

public struct GuitarView: View {
  public let store: Store<GuitarState, GuitarAction>
  
  public init(store: Store<GuitarState, GuitarAction>) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        HStack {
          ForEach(viewStore.tuning.notes) { note in
            Button(note.description) {
              viewStore.send(.play(note))
            }
          }
        }
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

struct GuitarView_Previews: PreviewProvider {
  static var previews: some View {
    GuitarView(store: GuitarState.mockStore)
  }
}
