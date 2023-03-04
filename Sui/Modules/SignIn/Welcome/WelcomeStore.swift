//
//  WelcomeStore.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import Foundation
import ComposableArchitecture

struct WelcomeStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case .onAppear:
            return .task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                return .goNext
            }
            
        case .goNext:
            return .none

        }
    }
    
}

// MARK: - State

extension WelcomeStore {
    
    struct State: Equatable, Identifiable {
        
        static let initialState = State(
            id: UUID()
        )
        
        let id: UUID
  
    }
    
}

// MARK: - Action

extension WelcomeStore {
    
    enum Action: Equatable {
        case onAppear
        case goNext
    }
    
}

