//
//  LintAllTargetsStrictry.swift
//
//
//  Created by ororo on 2022/07/18.
//

import PackagePlugin

@main
struct LintAllTargetsStrictry: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target _: Target) async throws -> [Command] {
        return [
            .buildCommand(
                displayName: "Lint All Targets Strictry",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--strict",
                    "--path",
                    // 全Moduleを対象
                    ".",
                ],
                environment: [:]
            ),
        ]
    }
}
