// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SQLiteCW.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SQLiteCW",
            targets: ["SQLite"]
        )
    ],
    targets: [
        .target(
            name: "SQLiteCW",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "SQLiteCWTests",
            dependencies: [
                "SQLiteCW"
            ],
            path: "Tests/SQLiteCWTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CSQLite", package: "CSQLite")
]
#endif
