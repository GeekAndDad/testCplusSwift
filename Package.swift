// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "testCmd",
	platforms: [.macOS(.v14)],
	products: [
		.executable(name: "testCmd", targets: ["testCmd"]),
		.library(name: "SwiftMurmurLib", targets: ["SwiftMurmurLib"]),
		.library(name: "MurmurTest", targets: ["MurmurTest"]),
		.library(name: "Murmur", targets: ["Murmur"])
	],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0")
    ],
    targets: [
        .executableTarget(
            name: "testCmd",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
				, .target(name: "SwiftMurmurLib")
            ]
			, swiftSettings: [.interoperabilityMode(.Cxx)]
        )
		, .target(name: "SwiftMurmurLib",
			dependencies: [
				.target(name: "MurmurTest")
			]
			, swiftSettings: [.interoperabilityMode(.Cxx)]
		)
		, .target(name: "MurmurTest",
			  dependencies: [
				.target(name: "Murmur")
			  ]
			  , swiftSettings: [.interoperabilityMode(.Cxx)]
		)
		, .target(name: "Murmur",
				dependencies: []
				// path: "Sources/Murmur"
				// sources: ["Sources/Mumur/MurmurHash3.cpp"]
		)
    ]
)
