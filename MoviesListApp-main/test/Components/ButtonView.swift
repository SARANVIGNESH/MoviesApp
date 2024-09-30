//
//  ButtonView.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 26/07/23.
//

import SwiftUI

struct ButtonView: View {

    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .padding()
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
}

