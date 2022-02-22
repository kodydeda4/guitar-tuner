import Foundation

public enum InstrumentTuning: String {
  case eStandard = "E Standard"
  case dropD = "Drop D"
  case dadgad = "DADGAD"
}

extension InstrumentTuning: Identifiable { public var id: String { rawValue } }
extension InstrumentTuning: Equatable {}
extension InstrumentTuning: CaseIterable {}

public extension InstrumentTuning {
  var notes: [Note] {
    switch self {
    case .eStandard:
      return [
        Note(description: "E2", midiRawValue: 40),
        Note(description: "A2", midiRawValue: 45),
        Note(description: "D3", midiRawValue: 50),
        Note(description: "G3", midiRawValue: 55),
        Note(description: "B3", midiRawValue: 59),
        Note(description: "e4", midiRawValue: 64)
      ]
      
    case .dropD:
      return [
        Note(description: "D2", midiRawValue: 38),
        Note(description: "A2", midiRawValue: 45),
        Note(description: "D3", midiRawValue: 50),
        Note(description: "G3", midiRawValue: 55),
        Note(description: "B3", midiRawValue: 59),
        Note(description: "e4", midiRawValue: 64)
      ]
      
    case .dadgad:
      return [
        Note(description: "D2", midiRawValue: 38),
        Note(description: "A2", midiRawValue: 45),
        Note(description: "D3", midiRawValue: 50),
        Note(description: "G3", midiRawValue: 55),
        Note(description: "A3", midiRawValue: 57),
        Note(description: "D4", midiRawValue: 64)
      ]
    }
  }
}
