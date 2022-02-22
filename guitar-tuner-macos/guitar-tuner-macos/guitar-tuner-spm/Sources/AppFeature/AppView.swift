import SwiftUI
import ComposableArchitecture
import Models
import GuitarFeature

public struct AppView: View {
  public let store: Store<AppState, AppAction>
  
  public init(store: Store<AppState, AppAction> = AppState.defaultStore) {
    self.store = store
  }
  
  public var body: some View {
#if os(macOS)
    AppView_macOS(store: store)
#elseif os(iOS)
    AppView_iOS(store: store)
#endif
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: AppState.defaultStore)
  }
}
