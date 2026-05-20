// swift-tools-version: 6.3

import PackageDescription

let package = Package(
  name: "BasePrimitives",
  platforms: [
    //    .iOS("17.0"),
    .macOS("14.0")
  ],

  products: [
    .library(name: "BasePrimitives", targets: ["BasePrimitives"]),
    .library(name: "ViewHelpers", targets: ["ViewHelpers"]),
    .library(
      name: "CoreUtilities",
      targets: [
        "CoreUtilities",
        "InputPrimitives",
      ],
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "BasePrimitives",
      dependencies: ["InputPrimitives", "CoreUtilities"],
    ),
    .target(name: "ViewHelpers"),
    .target(name: "InputPrimitives"),
    .target(name: "CoreUtilities"),
  ],
)
