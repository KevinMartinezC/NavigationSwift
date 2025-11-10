//
//  LoadingView.swift
//  UIComponents
//
//  Created by KevinMartinez on 11/10/25.
//

import SwiftUI

public struct LoadingView: View {

    public init() {}

    public var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .scaleEffect(1.5)

            Text("Loading character...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    LoadingView()
}
