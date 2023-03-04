//
//  StandardButton.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import SwiftUI

struct StandardButton: View {
    
    let text: String
    let action: () ->  Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: 300, height: 50)
                
                Text(text)
                    .foregroundColor(.white)
            }
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
}

