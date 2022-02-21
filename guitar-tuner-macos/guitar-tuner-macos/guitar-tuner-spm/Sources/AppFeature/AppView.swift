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
    WithViewStore(store) { viewStore in
      GuitarView(store: store.scope(
        state: \.guitar,
        action: AppAction.guitar
      ))
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: AppState.defaultStore)
  }
}
