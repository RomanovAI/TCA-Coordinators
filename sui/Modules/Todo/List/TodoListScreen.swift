//
//  TodoListScreen.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct TodoListScreen: View {
    
    let store: StoreOf<TodoListStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                VStack {
                    Text("Todo list")
                        .onTapGesture {
                            viewStore.send(.buttonTapped)
                        }
                    Spacer()
                }
                .defaultPadding()
                .navigationTitle("Todo list")
            }
        }
        
    }
    
}
