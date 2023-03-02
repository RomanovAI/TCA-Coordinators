//
//  ProfileSharedStore.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct ProfileSharedStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.profile, action: /Action.profile) {
            ProfileStore()
        }
    }
    
}

// MARK: - State

extension ProfileSharedStore {
    
    enum State: Equatable, Identifiable {
        case profile(ProfileStore.State)
        
        var id: UUID {
            switch self {
            case .profile(let state):
                return state.id
            }
        }
        
    }
    
}

// MARK: - Action

extension ProfileSharedStore {
    
    enum Action: Equatable {
        case profile(ProfileStore.Action)
    }
    
}
