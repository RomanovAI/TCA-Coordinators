//
//  ProfileScreen.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct ProfileScreen: View {
    
    let store: StoreOf<ProfileStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("Profile")
            }
            .defaultPadding()
        }
        .navigationTitle("Profile")
    }
    
}
