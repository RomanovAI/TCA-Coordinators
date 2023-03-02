//
//  View+TabView.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import SwiftUI

struct ShowTabView: ViewModifier {
    
    func body(content: Content) -> some View {
        content.padding(.zero).onAppear {
            showTabView()
        }
    }
    
    private func showTabView() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = false
            }
        })
    }
}

struct HiddenTabView: ViewModifier {
    
    func body(content: Content) -> some View {
        content.padding(.zero).onAppear {
            hideTabView()
        }
    }
    
    private func hideTabView() {
        UIApplication.shared.key?.allSubviews().forEach({ subView in
            if let view = subView as? UITabBar {
                view.isHidden = true
            }
        })
    }
}

extension View {
    
    func showTabView() -> some View {
        modifier(ShowTabView())
    }
    
    func hiddenTabView() -> some View {
        modifier(HiddenTabView())
    }
}
