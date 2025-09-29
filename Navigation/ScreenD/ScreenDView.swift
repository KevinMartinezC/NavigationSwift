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

    var body: some View {
        VStack(spacing: 20) {
            Text("Screen D")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Go to Screen E") {
                router.push(to: .screenE(.init(message: "Hello from D")))
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
