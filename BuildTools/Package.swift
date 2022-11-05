// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .plugin(
            name: "LintPlugin",
            targets: ["LintAllTargetsStrictry"]
        ),
        .plugin(
            name: "FormatPlugin",
            targets: ["FormatAllTargets"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // ビルド時間の短縮、及びPlugin上での利用のため、コンパイル済みのSwiftLintを設定する
        .binaryTarget(
            name: "SwiftLintBinary",
            url:
            "https://github.com/realm/SwiftLint/releases/download/0.47.1/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "82ef90b7d76b02e41edd73423687d9cedf0bb9849dcbedad8df3a461e5a7b555"
        ),
        .binaryTarget(
            name: "swiftformat",
            url: "https://github.com/nicklockwood/SwiftFormat/releases/download/0.50.3/swiftformat.artifactbundle.zip",
            checksum: "a3221d54c2ac00f5c0ce0a2ebc6906ee371d527814174a9c65983f3a3a395321"
        ),
        .plugin(
            name: "LintAllTargetsStrictry",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary",
            ]
        ),
        .plugin(
            name: "FormatAllTargets",
            capability: .command(
                intent: .sourceCodeFormatting(), permissions: [.writeToPackageDirectory(reason: "Source Code Formatting")]
            ),
            dependencies: [
                "swiftformat",
            ]
        ),
    ]
)
