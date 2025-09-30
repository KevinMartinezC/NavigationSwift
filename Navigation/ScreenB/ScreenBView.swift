//
//  ScreenB.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct ScreenBView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: ScreenBViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen B")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextFielView(text: $viewModel.message)
            
            HStack {
                
                Button("Back") {
                    
                }
                
                Button("Go to Screen C") {
                    router.push(to: .screenC(.init(message:viewModel.message)))
                }
                .buttonStyle(.borderedProminent)
                
            }
        }
        .padding()
    }
}
