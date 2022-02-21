import Foundation

/// Resource containing MIDI samples.
/// Hint: Uses `.sf2` file format.
public struct AVSoundFont {
  public let url: URL
  
  public init(url: URL) {
    self.url = url
  }
}
