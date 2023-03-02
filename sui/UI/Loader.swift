//
//  Loader.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import SwiftUI

struct Loader: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            ProgressView()
                .scaleEffect(2)
            
            Spacer()
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
