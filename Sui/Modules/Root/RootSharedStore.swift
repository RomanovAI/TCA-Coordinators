//
//  RootSharedStore.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct RootSharedStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.signIn, action: /Action.signIn) {
            SignInCoordinator()
        }
        Scope(state: /State.tab, action: /Action.tab) {
            TabCoordinator()
        }
    }
    
}

// MARK: - State

extension RootSharedStore {
    
    enum State: Equatable, Identifiable {
        
        case signIn(SignInCoordinator.State)
        case tab(TabCoordinator.State)
        
        var id: UUID {
            switch self {
            case .signIn(let state):
                return state.id
            case .tab(let state):
                return state.id
            }
        }
    }
    
}

// MARK: - Action

extension RootSharedStore {
    
    enum Action: Equatable {
        case signIn(SignInCoordinator.Action)
        case tab(TabCoordinator.Action)
    }
    
}
