//
//  ProfileAction.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import ComposableArchitecture

extension ProfileStore {
    
    enum Action: Equatable {
        case onAppear
        case logout
        case receiveProfileResponse(TaskResult<ProfileResponseModel>)
        case deleteAccount
        
        case alertDismissed
        
        case confirmationDialogButtonTapped
        case confirmationDialogDismissed
    }
    
}
