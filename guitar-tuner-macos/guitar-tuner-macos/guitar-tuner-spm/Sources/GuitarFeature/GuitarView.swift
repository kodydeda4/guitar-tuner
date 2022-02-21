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
#if os(macOS)
      GuitarView_macOS(store: store)
#elseif os(iOS)
      GuitarView_iOS(store: store)
#endif
    }
  }
}

struct GuitarView_Previews: PreviewProvider {
  static var previews: some View {
    GuitarView(store: GuitarState.mockStore)
  }
}
