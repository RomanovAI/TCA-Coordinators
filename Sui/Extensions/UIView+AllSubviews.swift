//
//  UIView+AllSubviews.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import UIKit

extension UIView {
    func allSubviews() -> [UIView] {
        var subs = subviews
        for subview in subviews {
            let rec = subview.allSubviews()
            subs.append(contentsOf: rec)
        }
        return subs
    }
}
