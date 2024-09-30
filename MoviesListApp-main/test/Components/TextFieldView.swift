//
//  TextFieldView.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 26/07/23.
//

import SwiftUI

struct LineTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration
                .overlay(Rectangle().frame(height: 1).foregroundColor(Color.gray), alignment: .bottom)
        }
    }
}


struct TextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let isSecure: Bool
    let commitAction: () -> Void
    let editingChangedAction: (Bool) -> Void

    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text, onCommit: commitAction)
            } else {
                TextField(placeholder, text: $text, onEditingChanged: editingChangedAction)
            }
        }
        .padding()
    }
   
}


