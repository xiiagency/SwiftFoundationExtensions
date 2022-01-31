// swift-tools-version:5.5
import PackageDescription

let package =
  Package(
    name: "SwiftFoundationExtensions",
    platforms: [
      .iOS(.v15),
      .watchOS(.v8),
      .macOS(.v12),
    ],
    products: [
      .library(
        name: "SwiftFoundationExtensions",
        targets: ["SwiftFoundationExtensions"]
      ),
    ],
    dependencies: [],
    targets: [
      .target(
        name: "SwiftFoundationExtensions",
        dependencies: []
      ),
      // NOTE: Re-enable when tests are added.
//      .testTarget(
//        name: "SwiftFoundationExtensionsTests",
//        dependencies: ["SwiftFoundationExtensions"]
//      ),
    ]
  )
