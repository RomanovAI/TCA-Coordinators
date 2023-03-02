//
//  LoginState.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import Foundation
import ComposableArchitecture

// MARK: - State

extension LoginStore {
    
    struct State: Equatable, Identifiable {
        
        static let initialState = State(
            id: UUID(),
            loginText: .init(),
            passwordText: .init(),
            errorText: .init(),
            successLogin: "User",
            successPassword: "123"
        )
        
        let id: UUID
        var loginText: String
        var passwordText: String
        var errorText: String
        var successLogin: String
        var successPassword: String
        var alert: AlertState<Action>?
        
    }
    
}
