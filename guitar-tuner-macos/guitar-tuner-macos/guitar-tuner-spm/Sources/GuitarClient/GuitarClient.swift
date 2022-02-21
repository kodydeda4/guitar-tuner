import Models
import ComposableArchitecture

public struct GuitarClient {
  public let play: (Note) -> Effect<Never, Never>
}
