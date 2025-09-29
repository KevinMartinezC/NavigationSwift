//
//  ScreenA.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ScreenAView: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Screen A")
                .font(.largeTitle)
                .fontWeight(.bold)
            //            
            //            if !router.inputValueFromScreenE.isEmpty {
            //                Text("Received Input Value:")
            //                    .font(.headline)
            //                Text(router.inputValueFromScreenE)
            //                    .padding()
            //                    .background(Color.green.opacity(0.2))
            //                    .cornerRadius(8)
            //            }
            
            Button("Go to Screen B") {
                router.push(to: .screenB(.init(message:"hello from screen A")))
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
