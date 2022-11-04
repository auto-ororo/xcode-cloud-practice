//
//  FirebaseUnitTests.swift
//  
//
//  Created by ororo on 2022/08/20.
//

import Foundation
import XCTest
import Firebase

final class FirebaseUnitTests: XCTestCase {

    let collectionPath = "test"

    override func setUp() {
        super.setUp()
        FirebaseTestHelper.setupFirebaseApp()
    }

    override func tearDown() {
        super.tearDown()
        FirebaseTestHelper.deleteFirebaseApp()
    }

    @MainActor
    func testAddDocument() async throws {
        Firestore.firestore().collection(collectionPath).addDocument(data: ["number": 10])

        let doc = try await Firestore.firestore().collection(collectionPath)
            .getDocuments().documents.first?.data()["number"] as? Int

        XCTAssertEqual(doc, 10)
    }

    @MainActor
    func testEmptyDocument() async throws {
        let doc = try await Firestore.firestore().collection(collectionPath)
            .getDocuments().documents.first?.data()["number"] as? Int

        XCTAssertEqual(doc, nil)
    }

    // キーチェーンエラーが解決するまでコメントアウト
//    @MainActor
//    func testAuth() async throws {
//        try Auth.auth().signOut()
//        try await Auth.auth().createUser(withEmail: "eeeafdsdsa@dsa.aaa", password: "Aaaaaaaa")
//    }
}

enum FirebaseTestHelper {
    static func setupFirebaseApp() {
        if FirebaseApp.app() == nil {
            let options = FirebaseOptions(
                googleAppID: "0:0:ios:0",
                gcmSenderID: "0"
            )
            options.projectID = "test-\(UUID().uuidString)"
            FirebaseApp.configure(options: options)
            let settings = Firestore.firestore().settings
            settings.host = "0.0.0.0:1234"
            settings.isSSLEnabled = false
            settings.isPersistenceEnabled = false
            Firestore.firestore().settings = settings

            Auth.auth().useEmulator(withHost: "0.0.0.0", port: 4321)

            print("FirebaseApp has been configured")
        }
    }

    static func deleteFirebaseApp() {
        guard let app = FirebaseApp.app() else {
            return
        }
        app.delete { _ in print("FirebaseApp has been deleted") }
    }
}
