//
//  ViewModifier+DefaultPadding.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI

struct DefaultPadding: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(16)
    }
    
}

extension View {
    
    func defaultPadding() -> some View {
        modifier(DefaultPadding())
    }
    
}
