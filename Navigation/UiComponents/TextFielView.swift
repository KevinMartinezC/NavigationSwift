//
//  TextFielView.swift
//  Navigation
//
//  Created by KevinMartinez on 9/30/25.
//

import SwiftUI

struct TextFielView: View {
   @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: UITextAutocapitalizationType = .sentences
    
    var body: some View {
        TextField("Enter Value", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(keyboardType)
            .autocapitalization(autocapitalization)
    }
}
