//
//  TodoDetailScreen.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct TodoDetailScreen: View {
    
    let store: StoreOf<TodoDetailStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    Text("Todo detail")
                    Spacer()
                }
                .defaultPadding()
                .navigationTitle("Todo detail")
            }
        }
        
    }
    
}

