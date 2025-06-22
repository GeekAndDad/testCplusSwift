// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "testCmd",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "Murmur", targets: [ "Murmur"]),
		.executable(name: "testCmd", targets: ["testCmd"])
	],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0")
    ],
    targets: [
        .executableTarget(
            name: "testCmd",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
				.target(name: "Murmur")
            ],
			swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
		.target(name: "Murmur",
			dependencies: []
		)
    ]
)
