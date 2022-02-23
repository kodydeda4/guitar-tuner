import Models
import Foundation
import AVKit
import AVFoundation

public extension TunerClient {
  static var live: Self {
//    let conductor = MidiConductor(
//      soundfont: Bundle.main.url(forResource: "Guitar", withExtension: "sf2")!,
//      volume: 0.5,
//      channel: 1
//    )
    
    return Self(
      play: { note in
//        conductor.play(note.midiRawValue)
        return .none
      }
    )
  }
}

///// Play MIDI through a SoundFont.
//struct MidiConductor {
//  public var soundfont: URL
//  public var volume: Float
//  public var channel: UInt8 = 0
//  let audioEngine = AVAudioEngine()
//  let unitSampler = AVAudioUnitSampler()
//
//  public func play(_ note: UInt8) {
//    unitSampler.startNote(
//      note,
//      withVelocity: 80,
//      onChannel: channel
//    )
//  }
//
//  public init(
//    soundfont: URL,
//    volume: Float = 0.5,
//    channel: UInt8 = 0
//  ) {
//    // Properties
//    self.soundfont = soundfont
//    self.volume = volume
//    self.channel = channel
//
//    // AudioEngine
//    audioEngine.mainMixerNode.volume = volume
//    audioEngine.attach(unitSampler)
//    audioEngine.connect(
//      unitSampler,
//      to: audioEngine.mainMixerNode,
//      format: nil
//    )
//
//    // UnitSampler
//    if let _ = try? audioEngine.start() {
//      try? unitSampler.loadSoundBankInstrument(
//        at: soundfont,
//        program: 0,
//        bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB),
//        bankLSB: UInt8(kAUSampler_DefaultBankLSB)
//      )
//    }
//  }
//}
