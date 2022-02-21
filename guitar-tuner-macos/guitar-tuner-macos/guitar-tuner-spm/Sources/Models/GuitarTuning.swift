import Foundation

public enum GuitarTuning: String {
  case eStandard
  case dropD
}

extension GuitarTuning: Identifiable { public var id: String { rawValue } }
extension GuitarTuning: Equatable {}
extension GuitarTuning: CaseIterable {}

public extension GuitarTuning {
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
    }
  }
}
