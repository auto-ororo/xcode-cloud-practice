//
//  ContentView.swift
//
//  Created by ororo on 2022/07/17.
//

import SwiftUI

public struct ContentView: View {
    public init(envName: String, secretKey: String) {
        self.envName = envName
        self.secretKey = secretKey
    }

    let envName: String
    let secretKey: String
    public var body: some View {
        VStack {
            HStack {
                Text("環境：")
                Text(envName)
            }
                        
            
            
            
            .padding(.vertical, 16)
            HStack {
                Text("SecretKey：")
                Text(secretKey)
            }
            .padding(.vertical, 16)
        }.font(.title2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            envName: "Preview",
            secretKey: "hogehoge"
        )
    }
}
