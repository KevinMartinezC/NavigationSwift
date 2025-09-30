//
//  ScreenD.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct ScreenDView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: ScreenDViewModel
    let completion: (String) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen D")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextFielView(text: $viewModel.message)
            
            HStack {
                Button("Back") {
                    router.pop()
                    completion(viewModel.message)
                }
                
                Button("Go to Screen E") {
                    router.push(to: .screenE(
                        .init(
                            message: viewModel.message,
                            onComplete: { message in
                                viewModel.message = message
                            }
                        )
                    ))
                }
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
