//
//  ErrorView.swift
//  UIComponents
//
//  Created by KevinMartinez on 11/10/25.
//

import SwiftUI

public struct ErrorView: View {
    public let error: String
    public let retryAction: () -> Void

    public init(error: String, retryAction: @escaping () -> Void) {
        self.error = error
        self.retryAction = retryAction
    }

    public var body: some View {
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
