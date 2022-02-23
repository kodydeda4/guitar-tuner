import SwiftUI

extension View {
  func navigationView() -> some View {
    NavigationView {
      self
    }
  }
  func navigationLink<Label: View>(@ViewBuilder _ label: () -> Label) -> some View {
    NavigationLink(destination: { self }, label: label)
  }
}
