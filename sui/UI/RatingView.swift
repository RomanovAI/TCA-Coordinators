//
//  RatingView.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Int
    private let maxRating: Int = 10
    
    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    
    static var previews: some View {
        RatingView(rating: 5)
    }
    
}
