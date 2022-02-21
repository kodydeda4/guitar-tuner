import Foundation

public struct Note {
  public let description: String
  public let midiRawValue: UInt8
}

// MARK: Extensions
extension Note: Equatable {}
extension Note: Identifiable { public var id: UInt8 { midiRawValue } }
