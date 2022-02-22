import Foundation

public enum Instrument: String {
  case guitar = "Guitar"
  case bass = "Bass"
  case ukelele = "Ukelele"
}

extension Instrument: Identifiable { public var id: String { rawValue } }
extension Instrument: Equatable {}
extension Instrument: CaseIterable {}
extension Instrument { var imageAssetName: String { rawValue } }
