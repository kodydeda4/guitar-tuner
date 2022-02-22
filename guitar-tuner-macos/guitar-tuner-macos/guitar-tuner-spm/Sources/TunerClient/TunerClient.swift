import Models
import ComposableArchitecture

public struct TunerClient {
  public let play: (Note) -> Effect<Never, Never>
}
