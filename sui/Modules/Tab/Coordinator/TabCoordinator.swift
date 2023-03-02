//
//  TabCoordinatorView.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct TabCoordinatorView: View {
    
    enum Tab: String {
        case main = "Main"
        case profile = "Profile"
    }
    
    let store: StoreOf<TabCoordinator>
    
    var body: some View {
        TabView {
            MovieCoordinatorView(
                store: store.scope(
                    state: \.movie,
                    action: TabCoordinator.Action.movie
                )
            )
            .tabItem {
                Text(Tab.main.rawValue)
            }
            
            ProfileCoordinatorView(
                store: store.scope(
                    state: \.profile,
                    action: TabCoordinator.Action.profile
                )
            )
            .tabItem {
                Text(Tab.profile.rawValue)
            }
        }
    }
    
}

// MARK: - Coordinator

struct TabCoordinator: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.movie, action: /Action.movie) {
            MovieCoordinator()
        }
        Scope(state: \.profile, action: /Action.profile) {
            ProfileCoordinator()
        }
    }
    
}

// MARK: - State

extension TabCoordinator {
    
    struct State: Equatable, Identifiable {
        
        static let initialState = State(
            id: UUID(),
            movie: .initialState,
            profile: .initialState
        )
        
        var id: UUID
        var movie: MovieCoordinator.State
        var profile: ProfileCoordinator.State
    
    }
    
}

// MARK: - Action

extension TabCoordinator {
    
    enum Action: Equatable {
        case movie(MovieCoordinator.Action)
        case profile(ProfileCoordinator.Action)
    }
    
}
