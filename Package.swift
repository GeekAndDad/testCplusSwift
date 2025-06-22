// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "testCmd",
	platforms: [.macOS(.v14)],
	products: [
		.library(name: "Murmur", targets: [ "Murmur"]),
		.executable(name: "testCmd", targets: ["testCmd"])
	],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
		
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
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
//				path: nil,
//				exclude: [],
//				sources: nil,
//				resources: nil,
//				publicHeadersPath: nil, // <#T##String?#>,
//				packageAccess: false,
//				cSettings: nil, // <#T##[CSetting]?#>,
//				cxxSettings: nil, // <#T##[CXXSetting]?#>,
//				swiftSettings: [.interoperabilityMode(.Cxx)]
//				linkerSettings: nil, // <#T##[LinkerSetting]?#>,
//				plugins: nil // <#T##[Target.PluginUsage]?#>
		)
    ]
)
