// swift-tools-version:5.9

import PackageDescription

let package: Package = .init(
	name: "swift-numerals",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v15),
		.macOS(.v10_15),
		.watchOS(.v6)
	],
	products: [
		.library(name: "Numerals", targets: ["Numerals"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-numeric-protocols.git", .upToNextMinor(from: "0.2.0")),
        .package(url: "https://github.com/apple/swift-numerics.git", .upToNextMajor(from: "1.0.2")),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin.git", .upToNextMajor(from: "1.4.2"))
	],
	targets: [
		.target(
			name: "Numerals",
			dependencies: [
				.product(name: "NumericProtocols", package: "swift-numeric-protocols"),
                .product(name: "Numerics", package: "swift-numerics")
			],
			path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
		),
		.testTarget(
			name: "NumeralsTests",
			dependencies: ["Numerals"],
			path: "Tests",
			resources: [
				.process("NumeralsTests/Resources")
			],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
		)
	],
	swiftLanguageVersions: [.v5]
)
