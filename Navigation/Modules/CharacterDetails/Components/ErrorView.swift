//
//  ErrorView.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct ErrorView: View {
    let error: String
    let retryAction: () -> Void

    var body: some View {
        ContentUnavailableView {
            Label("Error", systemImage: "exclamationmark.triangle")
        } description: {
            Text(error)
        } actions: {
            Button("Retry", action: retryAction)
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ErrorView(error: "Failed to load character") {
        print("Retry tapped")
    }
}
