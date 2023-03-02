//
//  TodoSharedStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import ComposableArchitecture

struct TodoSharedStore: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.list, action: /Action.list) {
            TodoListStore()
        }
        
        Scope(state: /State.detail, action: /Action.detail) {
            TodoDetailStore()
        }
    }
    
}

extension TodoSharedStore {
    
    enum State: Equatable, Identifiable {
        
        case list(TodoListStore.State)
        case detail(TodoDetailStore.State)
        
        var id: UUID {
            switch self {
            case .list(let state):
                return state.id
            case .detail(let state):
                return state.id
            }
        }
    }
    
}

extension TodoSharedStore {
    
    enum Action {
        case list(TodoListStore.Action)
        case detail(TodoDetailStore.Action)
    }
    
}
