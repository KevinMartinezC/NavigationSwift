//
//  ScreenC.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenC: View {
    @Environment(Router.self) private var router

    var body: some View {
        VStack(spacing: 20) {
            Text("Screen C")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Button("Go to Screen D") {
                router.push(AppRoute.screenD)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
