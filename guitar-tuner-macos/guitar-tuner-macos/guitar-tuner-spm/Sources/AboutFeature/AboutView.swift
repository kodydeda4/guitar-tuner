import SwiftUI
import ComposableArchitecture

public struct AboutView: View {
  public let store: Store<AboutState, AboutAction>
  
  public init(store: Store<AboutState, AboutAction>) {
    self.store = store
  }
  
  public var body: some View {
#if os(macOS)
    AboutView_macOS(store: store)
#elseif os(iOS)
    AboutView_iOS(store: store)
#endif
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView(store: AboutState.defaultStore)
  }
}
