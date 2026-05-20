// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "ToolKit",
  platforms: [
    .macOS("14.0")
  ],

  products: [
    .library(name: "CoreTools", targets: ["CoreTools"]),
    .library(name: "ViewTools", targets: ["ViewTools"]),

  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  ],
  targets: [
    .target(name: "CoreTools"),
    .target(
      name: "ViewTools",
      dependencies: ["CoreTools"],
    ),
  ],
)
