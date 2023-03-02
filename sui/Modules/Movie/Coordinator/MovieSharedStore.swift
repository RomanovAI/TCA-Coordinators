//
//  MovieSharedStore.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct MovieSharedStore: ReducerProtocol {
    
    enum Action: Equatable {
        case list(MovieListStore.Action)
        case detail(MovieDetailStore.Action)
    }
    
    enum State: Equatable, Identifiable {
        case list(MovieListStore.State)
        case detail(MovieDetailStore.State)
        
        var id: UUID {
            switch self {
            case .list(let state):
                return state.id
            case .detail(let state):
                return state.id
            }
        }
        
    }
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: /State.list, action: /Action.list) {
            MovieListStore()
        }
        Scope(state: /State.detail, action: /Action.detail) {
            MovieDetailStore()
        }
    }
    
}

