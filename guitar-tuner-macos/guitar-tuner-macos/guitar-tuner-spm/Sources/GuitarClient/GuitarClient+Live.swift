import Models
import Foundation
import AVSoundConductor

public extension GuitarClient {
  static var live: Self {
    let conductor = AVSoundConductor(
      soundfont: AVSoundFont(url: Bundle.main.url(forResource: "Acoustic Guitar", withExtension: "sf2")!),
      volume: 0.5,
      channel: 1
    )
    
    return Self(
      play: { note in
        conductor.play(note.midiRawValue)
        return .none
      }
    )
  }
}

