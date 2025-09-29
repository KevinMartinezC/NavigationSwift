//
//  ScreenE.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenE: View {
    @Environment(Router.self) private var router
    @State private var textInput: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen E")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter value", text: $textInput)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Submit & Return to A") {
                // Clear the navigation stack to return to root
                router.saveAndReturn(data: textInput)
            }
            .buttonStyle(.borderedProminent)
            .disabled(textInput.isEmpty)
        }
        .padding()
    }
}
