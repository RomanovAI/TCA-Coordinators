//
//  AppStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import ComposableArchitecture

struct AppStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.authorization, action: /Action.authorization) {
            AuthorizationStore()
        }
        
        Scope(state: /State.main, action: /Action.main) {
            MainTabStore()
        }
    }
   
}

// MARK: - State

extension AppStore {
    
    enum State: Equatable, Identifiable {
        
        case authorization(AuthorizationStore.State)
        case main(MainTabStore.State)
        
        var id: UUID {
            switch self {
            case .authorization(let state):
                return state.id
            case .main(let state):
                return state.id
            }
        }
    }
    
}

// MARK: - Action

extension AppStore {
    
    enum Action {
        case authorization(AuthorizationStore.Action)
        case main(MainTabStore.Action)
    }
    
}
