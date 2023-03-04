//
//  String+Trimming.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import Foundation

extension String {
    
    var isTrimmingEmpty: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}
