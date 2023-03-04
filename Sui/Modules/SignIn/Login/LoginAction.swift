//
//  LoginAction.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

extension LoginStore {
    
    enum Action: Equatable {
        case loginTextChanged(text: String)
        case passwordTextChanged(text: String)
        case buttonTapped
        case goNext
        
        case showAlert
        case alertDismissed
    }
    
}
