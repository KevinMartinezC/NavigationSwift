//
//  ScreenD.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct ScreenD: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text("Screen D")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Go to Screen E") {
                router.push(AppRoute.screenE)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
