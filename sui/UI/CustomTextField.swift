//
//  CustomTextField.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var borderColor: Color = .gray
    var borderWidth: CGFloat = 1
    var cornerRadius: CGFloat = 5
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
            }
            TextField("", text: $text)
                .foregroundColor(.black)
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
        )
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
