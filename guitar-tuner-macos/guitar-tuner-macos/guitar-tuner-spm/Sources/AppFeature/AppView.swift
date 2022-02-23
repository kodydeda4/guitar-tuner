import SwiftUI
import ComposableArchitecture
import Models
import InfoFeature
import TunerFeature

public struct AppView: View {
  public let store: Store<AppState, AppAction>
  
  public init(store: Store<AppState, AppAction> = .live) {
    self.store = store
  }
  
  public var body: some View {
#if os(macOS)
    AppView_macOS(store: store)
#elseif os(iOS)
    AppView_iOS(store: store)
#elseif os(watchOS)
    AppView_watchOS(store: store)
#endif
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(store: .live)
    
    AppView(store: .init(
      initialState: .init(
        tuner: .init(),
        info: .init(),
        route: .info
      ),
      reducer: appReducer,
      environment: .init(
        mainQueue: .main,
        guitarClient: .live
      )
    ))
  }
}
