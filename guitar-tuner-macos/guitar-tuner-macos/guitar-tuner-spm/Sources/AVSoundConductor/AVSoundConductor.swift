import AVKit
import AVFoundation

/// Play MIDI notes using an AVSoundFont.
public struct AVSoundConductor {
  public var soundfont: AVSoundFont
  public var volume: Float
  public var channel: UInt8 = 0
  let audioEngine = AVAudioEngine()
  let unitSampler = AVAudioUnitSampler()

  public init(
    soundfont: AVSoundFont,
    volume: Float = 0.5,
    channel: UInt8 = 0
  ) {
    // Properties
    self.soundfont = soundfont
    self.volume = volume
    self.channel = channel
    
    // AudioEngine
    audioEngine.mainMixerNode.volume = volume
    audioEngine.attach(unitSampler)
    audioEngine.connect(
      unitSampler,
      to: audioEngine.mainMixerNode,
      format: nil
    )
    
    // UnitSampler
    if let _ = try? audioEngine.start() {
      try? unitSampler.loadSoundBankInstrument(
        at: soundfont.url,
        program: 0,
        bankMSB: UInt8(kAUSampler_DefaultMelodicBankMSB),
        bankLSB: UInt8(kAUSampler_DefaultBankLSB)
      )
    }
  }
}

extension AVSoundConductor {
  public func play(_ note: UInt8) {
    unitSampler.startNote(
      note,
      withVelocity: 80,
      onChannel: channel
    )
  }
}
