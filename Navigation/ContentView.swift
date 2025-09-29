//
//  ContentView.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ScreenA()
            .navigationDestination(for: AppRoute.self) { screen in
                switch screen {
                case .screenB:
                    ScreenB()
                case .screenC:
                    ScreenC()
                case .screenD:
                    ScreenD()
                case .screenE:
                    ScreenE()
                }
            }
        }
        .environment( router)
    }
}

#Preview {
    ContentView()
}
