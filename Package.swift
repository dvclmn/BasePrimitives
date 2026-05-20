// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "ToolKit",
  platforms: [
    .macOS("14.0")
  ],

  products: [
    .library(
      name: "BasePrimitives",
      targets: [
        "BasePrimitives",
        "CoreUtilities",
      ],
    ),
    .library(name: "ViewHelpers", targets: ["ViewHelpers"]),

  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "BasePrimitives",
      dependencies: ["CoreUtilities", "ViewHelpers"],
    ),
    .target(name: "CoreUtilities"),
    .target(
      name: "ViewHelpers",
      dependencies: ["CoreUtilities"]
    ),
  ],
)
