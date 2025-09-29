//
//  ScreenE.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenEView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: ScreenEViewModel
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
                router.popToRoot()
            }
            .buttonStyle(.borderedProminent)
            .disabled(textInput.isEmpty)
        }
        .padding()
    }
}
