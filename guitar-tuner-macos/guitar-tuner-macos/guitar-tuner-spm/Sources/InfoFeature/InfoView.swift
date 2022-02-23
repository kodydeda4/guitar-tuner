import SwiftUI
import ComposableArchitecture

public struct InfoView: View {
  public let store: Store<InfoState, InfoAction>
  
  public init(store: Store<InfoState, InfoAction>) {
    self.store = store
  }
  
  public var body: some View {
#if os(macOS)
    InfoView_macOS(store: store)
#elseif os(iOS)
    InfoView_iOS(store: store)
#elseif os(watchOS)
    InfoView_watchOS(store: store)
#endif
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(store: .live)
  }
}
