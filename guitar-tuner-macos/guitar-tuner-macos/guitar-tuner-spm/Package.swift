// swift-tools-version:5.5

import PackageDescription

extension Target.Dependency {
  // Features
  static let appFeature: Self = "AppFeature"
  static let tunerFeature: Self = "TunerFeature"
  
  // Clients
  static let tunerClient: Self = "TunerClient"
  
  // Core
  static let models: Self = "Models"
  static let avSoundConductor: Self = "AVSoundConductor"
  static let composableArchitecture: Self = .product(
    name: "ComposableArchitecture",
    package: "swift-composable-architecture"
  )
}

let package = Package(
  name: "guitar-tuner-spm",
  platforms: [.macOS(.v12), .iOS(.v15)],
  products: [],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.31.0")
  ],
  targets: []
).addSources([
  
  // Features
  Source(name: "AppFeature", dependencies: [.tunerFeature]),
  Source(name: "TunerFeature", dependencies: [
    .composableArchitecture,
    .tunerClient,
    .models
  ]),
  
  // Clients
  Source(name: "TunerClient", dependencies: [
    .composableArchitecture,
    .avSoundConductor,
    .models,
  ]),
  
  // Core
  Source(name: "Models"),
  Source(name: "AVSoundConductor")
])


// MARK: - Extensions

struct Source {
  let name: String
  var dependencies: [Target.Dependency] = []
}

extension Package {
  func addSources(_ sources: [Source]) -> Package {
    self.products += sources.map { .library(name: $0.name, targets: [$0.name]) }
    self.targets += sources.map { .target(name: $0.name, dependencies: $0.dependencies) }
    return self
  }
}
