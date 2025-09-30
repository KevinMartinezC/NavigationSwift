//
//  ScreenA.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenAView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: ScreenAViewModel

    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen A")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextFielView(text: $viewModel.message)
            
            HStack{
                
                Button("Go to Screen B") {
                    router.push(to: .screenB(.init(
                        message: viewModel.message,
                        onComplete: { newMessage in
                            viewModel.message = newMessage
                        }
                    )))
                }
            }.buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            router.rootCompletion = { data in
                viewModel.message = data
            }
        }
    }
}
