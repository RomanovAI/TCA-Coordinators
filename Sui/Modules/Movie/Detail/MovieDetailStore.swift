//
//  MovieDetailStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import ComposableArchitecture

struct MovieDetailStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {}
    
}

// MARK: - State

extension MovieDetailStore {
    
    struct State: Equatable {
        static let initialState = State(
            id: UUID(),
            movie: .init(
                id: "",
                name: "",
                description: "",
                rating: 5
            )
        )
        
        let id: UUID
        var movie: MovieResponseModel
    }
    
}

// MARK: - Action

extension MovieDetailStore {
    
    enum Action: Equatable {}
    
}
