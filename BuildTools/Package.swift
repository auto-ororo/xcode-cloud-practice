// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    defaultLocalization: "ja",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .plugin(
            name: "LintPlugin",
            targets: ["LintAllModulesStrictry"]),
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
        .plugin(
            name: "LintAllModulesStrictry",
            capability: .buildTool(),
            dependencies: [
                "SwiftLintBinary"
            ]
        )
    ]
)
