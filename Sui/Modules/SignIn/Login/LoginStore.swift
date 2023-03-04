//
//  LoginStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture

struct LoginStore: ReducerProtocol {
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case .loginTextChanged(let text):
            state.loginText = text
            return .none
            
        case .passwordTextChanged(let text):
            state.passwordText = text
            return .none
            
        case .buttonTapped:
            return .merge(validate(&state))
            
        case .showAlert:
            state.alert = AlertState {
                TextState("Error")
            } actions: {
                ButtonState(
                    role: .cancel,
                    action: .alertDismissed
                ) {
                    TextState("Ok")
                }
            } message: { [errorText = state.errorText] in
                TextState(errorText)
            }
            return .none
            
        case .alertDismissed:
            state.alert = nil
            state.errorText = .init()
            return .none
            
        case .goNext:
            return .none
        }
        
    }
    
    // MARK: - private methods
    
    private func validate(_  state: inout State) -> [EffectTask<Action>] {
        var effects: [EffectTask<Action>] = .init()
        
        if state.successLogin != state.loginText {
            state.errorText = "Incorrect login"
        }
        
        
        if state.successPassword != state.successPassword {
            state.errorText += "\nIncorrect password"
        }
        
        if !state.errorText.isTrimmingEmpty {
            effects.append(.init(value: .showAlert))
        }
        
        if effects.isEmpty {
            effects.append(.init(value: .goNext))
        }
        
        return effects
    }
    
}
