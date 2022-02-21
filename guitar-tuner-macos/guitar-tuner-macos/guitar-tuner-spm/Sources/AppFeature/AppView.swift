import SwiftUI
import ComposableArchitecture

public struct AppView: View {
  public let store: Store<AppState, AppAction>
  
  public init(store: Store<AppState, AppAction> = AppState.defaultStore) {
    self.store = store
  }
  
  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        Text(viewStore.text)
        .padding(60)
        
        Button("Update") {
          viewStore.send(.updateText)
        }
      }
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: AppState.defaultStore)
  }
}
