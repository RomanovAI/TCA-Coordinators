//
//  ProfileService.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import ComposableArchitecture

final class ProfileService {
    
    static let live = ProfileService()
    
    func getProfile() async throws -> ProfileResponseModel  {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return .init(
                id: "32357872",
                firstName: "John",
                lastName: "Doe",
                phone: "79156654321",
                email: "JohnDoe@gmail.com"
            )
        } catch {
            throw error
        }
    }
    
}

extension ProfileService: DependencyKey {
    
    static var liveValue = ProfileService.live
    
}

extension DependencyValues {
    
    var profileService: ProfileService {
        get { self[ProfileService.self] }
        set { self[ProfileService.self] = newValue }
    }
    
}
