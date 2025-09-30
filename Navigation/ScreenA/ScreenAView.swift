//
//  ScreenA.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenAView: View {
    @Environment(Router.self) private var router
    @State private var textInput: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Screen A")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextFielView(text: $textInput)
            
            HStack
            {
                Button("Back") {
                    
                }
                Button("Go to Screen B") {
                    router.push(to: .screenB(.init(message:textInput)))
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
