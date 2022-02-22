import Foundation

public enum Instrument: String {
  case guitar = "Guitar"
  case bass = "Bass"
}

extension Instrument: Identifiable { public var id: String { rawValue } }
extension Instrument: Equatable {}
extension Instrument: CaseIterable {}
extension Instrument { var imageAssetName: String { rawValue } }
