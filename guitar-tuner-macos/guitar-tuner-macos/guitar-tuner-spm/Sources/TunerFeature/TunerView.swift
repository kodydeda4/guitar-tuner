import SwiftUI
import ComposableArchitecture
import Models

public struct TunerView: View {
  public let store: Store<TunerState, TunerAction>
  
  public init(store: Store<TunerState, TunerAction>) {
    self.store = store
  }
  
  public var body: some View {
#if os(macOS)
    TunerView_macOS(store: store)
#elseif os(iOS)
    TunerView_iOS(store: store)
#elseif os(watchOS)
    TunerView_watchOS(store: store)
#endif
  }
}

struct GuitarView_Previews: PreviewProvider {
  static var previews: some View {
    TunerView(store: .live)
  }
}
