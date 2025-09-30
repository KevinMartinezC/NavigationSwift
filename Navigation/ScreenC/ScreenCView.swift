//
//  ScreenC.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenCView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: ScreenCViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen C")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextFielView(text: $viewModel.message)
            
            HStack {
                Button("Back") {
                    router.pop()
                }
                
                Button("Go to Screen D") {
                    router.push(to: .screenD(.init(message:"hello from screen C")))
                }
            }
            
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
