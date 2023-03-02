//
//  AuthorizationStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture

struct AuthorizationStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case .loginTextChanged(let text):
            state.loginText = text
            return .none
            
        case .passwordTextChanged(let text):
            state.passwordText = text
            return .none
            
        case .buttonTapped:
            return .none
        }
    }
    
}

// MARK: - State

extension AuthorizationStore {
    
    struct State: Equatable {
        
        static let initialState = State(
            id: UUID(),
            loginText: .init(),
            passwordText: .init()
        )
        
        let id: UUID
        var loginText: String
        var passwordText: String
        
    }
    
}

// MARK: - Action

extension AuthorizationStore {
    
    enum Action {
        case loginTextChanged(text: String)
        case passwordTextChanged(text: String)
        case buttonTapped
    }
    
}
