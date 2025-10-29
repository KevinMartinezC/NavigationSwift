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
    let completion: (String) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen E")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter value", text: $viewModel.message)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack {
                Button("Back") {
                    router.pop()
                    completion(viewModel.message)
                }
                
                Button("Submit & Return to A") {
                    router.popToRoot(with: viewModel.message)
                }.disabled(viewModel.message.isEmpty)
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
