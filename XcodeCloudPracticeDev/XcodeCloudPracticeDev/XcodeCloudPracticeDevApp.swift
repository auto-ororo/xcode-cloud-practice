//
//  XcodeCloudPracticeDevApp.swift
//  XcodeCloudPracticeDev
//
//  Created by ororo on 2022/07/17.
//

import SwiftUI
import Content

@main
struct XcodeCloudPracticeDevApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(envName: "Dev", secretKey: secretKey)
        }
    }
}
