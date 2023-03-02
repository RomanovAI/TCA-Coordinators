//
//  SignInSharedStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SignInSharedStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.login, action: /Action.login) {
            LoginStore()
        }
        Scope(state: /State.welcome, action: /Action.welcome) {
            WelcomeStore()
        }
    }
    
}

// MARK: - State

extension SignInSharedStore {
    
    enum State: Equatable, Identifiable {
        case login(LoginStore.State)
        case welcome(WelcomeStore.State)
        
        var id: UUID {
            switch self {
            case .login(let state):
                return state.id
            case .welcome(let state):
                return state.id
            }
        }
        
    }
    
}

// MARK: - Action

extension SignInSharedStore {
    
    enum Action: Equatable {
        case login(LoginStore.Action)
        case welcome(WelcomeStore.Action)
    }
    
}
