//
//  XcodeCloudPracticePrdApp.swift
//  XcodeCloudPracticePrd
//
//  Created by ororo on 2022/07/17.
//

import SwiftUI
import Content

@main
struct XcodeCloudPracticePrdApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(envName: "Prd", secretKey: secretKey)
        }
    }
}
