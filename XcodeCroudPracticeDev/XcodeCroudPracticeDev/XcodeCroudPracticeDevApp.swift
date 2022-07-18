//
//  XcodeCroudPracticeDevApp.swift
//  XcodeCroudPracticeDev
//
//  Created by ororo on 2022/07/17.
//

import SwiftUI
import Content

@main
struct XcodeCroudPracticeDevApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(envName: "Dev", secretKey: secretKey)
        }
    }
}
