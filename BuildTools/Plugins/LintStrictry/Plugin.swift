//
//  LintStrictry.swift
//
//
//  Created by ororo on 2022/07/18.
//

import PackagePlugin

@main
struct LintStrictry: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .buildCommand(
                displayName: "Lint Strictry",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--strict",
                    target.directory.string   // only lint the files in the target directory
                ],
                environment: [:]
            ),
        ]
    }
}
