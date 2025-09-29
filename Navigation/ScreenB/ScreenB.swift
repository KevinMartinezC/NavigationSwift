//
//  ScreenB.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct ScreenB: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen B")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Go to Screen C") {
                router.push(AppRoute.screenC)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
