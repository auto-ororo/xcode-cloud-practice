//
//  FormatAllTargets.swift
//
//
//  Created by ororo on 2022/11/05.
//

import Foundation
import PackagePlugin

@main
struct FormatAllTargets: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let tool = try context.tool(named: "swiftformat")
        let toolURL = URL(fileURLWithPath: tool.path.string)

        let process = Process()
        process.executableURL = toolURL
        
        var processArguments = context.package.targets.map { target in
            target.directory.string
        }
        processArguments.append(contentsOf: arguments)
        process.arguments = processArguments

        try process.run()
        process.waitUntilExit()

        if process.terminationReason == .exit, process.terminationStatus == 0 {
            print("Formatted the source code")
        } else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("swiftformat invocation failed: \(problem)")
        }
    }
}
