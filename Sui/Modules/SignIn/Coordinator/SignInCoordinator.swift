//
//  SignInCoordinator.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct SignInCoordinatorView: View {
    
    let store: StoreOf<SignInCoordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) {
                CaseLet(
                    state: /SignInSharedStore.State.login,
                    action: SignInSharedStore.Action.login,
                    then: LoginScreen.init
                )
                CaseLet(
                    state: /SignInSharedStore.State.welcome,
                    action: SignInSharedStore.Action.welcome,
                    then: WelcomeScreen.init
                )
            }
        }
    }
    
}

// MARK: - Coordinator

struct SignInCoordinator: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .login(.goNext)):
                state.routes.push(.welcome(.initialState))
            default:
                break
            }
            return .none
        }.forEachRoute {
            SignInSharedStore()
        }
    }
    
}

// MARK: - State

extension SignInCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        static let initialState = State(
            id: UUID(),
            routes: [.root(.login(.initialState), embedInNavigationView: true)]
        )
        var id: UUID
        var routes: IdentifiedArrayOf<Route<SignInSharedStore.State>>
    }
    
}

// MARK: - Action

extension SignInCoordinator {
    
    enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(SignInSharedStore.State.ID, action: SignInSharedStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<SignInSharedStore.State>>)
    }
    
}
