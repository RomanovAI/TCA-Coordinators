//
//  ProfileStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture

struct ProfileStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        }
    }
    
}

extension ProfileStore {
    
    struct State: Equatable {
        
        static let initialState = State(
            id: UUID()
        )
        
        let id: UUID
    }
    
}

extension ProfileStore {
    
    enum Action {
        
    }
    
}
