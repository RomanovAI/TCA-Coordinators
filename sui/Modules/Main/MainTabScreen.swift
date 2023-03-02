//
//  MainTabScreen.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct MainTabScreen: View {
    
    let store: StoreOf<MainTabStore>
    
    var body: some View {
        TabView {
            TodoSharedScreen(store: store.scope(
                state: \MainTabStore.State.todo,
                action: MainTabStore.Action.todo
            ))
            .tabItem { Text("Todo") }
            
            
            ProfileScreen(store: store.scope(
                state: \MainTabStore.State.profile,
                action: MainTabStore.Action.profile
            ))
            .tabItem { Text("Profile") }
        }
    }
    
}
