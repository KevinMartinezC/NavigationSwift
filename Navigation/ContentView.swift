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
            ScreenAView()
                .navigationDestination(for: AppRoute.self) { screen in
                    navGrap(for: screen)
                }
        }
        .environment( router)
    }
}

#Preview {
    ContentView()
}
