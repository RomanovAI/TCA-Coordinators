//
//  TodoListStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture

struct TodoListStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .buttonTapped:
            return .none
        }
    }
    
}

extension TodoListStore {
    
    struct State: Equatable {
        static let initialState = State(
            id: UUID()
        )
        
        let id: UUID
    }
    
}

extension TodoListStore {
    
    enum Action {
        case buttonTapped
    }
    
}
