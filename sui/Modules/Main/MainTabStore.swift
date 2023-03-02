//
//  MainTabStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct MainTabStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.todo, action: /Action.todo) {
            TodoSharedStore()
        }
        Scope(state: \.profile, action: /Action.profile) {
            ProfileStore()
        }
    }
    
}

// MARK: - State

extension MainTabStore {
    
    struct State: Equatable {
        
        static let initialState = State(
            id: UUID(),
            profile: .initialState,
            todo: .list(.initialState)
        )
        
        let id: UUID
        var profile: ProfileStore.State
        var todo: TodoSharedStore.State
    }
    
}

// MARK: - Action

extension MainTabStore {
    
    enum Action {
        case profile(ProfileStore.Action)
        case todo(TodoSharedStore.Action)
    }
    
}
