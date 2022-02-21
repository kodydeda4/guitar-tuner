// swift-tools-version:5.5

import PackageDescription

extension Target.Dependency {
  static let appFeature: Self = "AppFeature"
  static let composableArchitecture: Self = .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
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
  Source(name: "AppFeature", dependencies: [.composableArchitecture])
])


// MARK: - Helpers

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
