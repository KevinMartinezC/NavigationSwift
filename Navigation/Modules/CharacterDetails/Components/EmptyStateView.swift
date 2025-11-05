//
//  EmptyStateView.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
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
