//
//  UIApplication+Key.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import UIKit

extension UIApplication {
    var key: UIWindow? {
        connectedScenes
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?
            .windows
            .filter({$0.isKeyWindow})
            .first
    }
}
