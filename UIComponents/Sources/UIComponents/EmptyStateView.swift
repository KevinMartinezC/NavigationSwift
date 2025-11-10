//
//  EmptyStateView.swift
//  UIComponents
//
//  Created by KevinMartinez on 11/10/25.
//

import SwiftUI

public struct EmptyStateView: View {

    public init() {}

    public var body: some View {
        ContentUnavailableView(
            "Character Not Found",
            systemImage: "person.slash",
            description: Text("Unable to load character information")
        )
    }
}

#Preview {
    EmptyStateView()
}
