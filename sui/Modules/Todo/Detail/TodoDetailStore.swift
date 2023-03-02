//
//  TodoDetailStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import ComposableArchitecture

struct TodoDetailStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        }
    }
    
}

extension TodoDetailStore {
    
    struct State: Equatable {
        static let initialState = State(
            id: UUID()
        )
        
        let id: UUID
    }
    
}

extension TodoDetailStore {
    
    enum Action {
        
    }
    
}
