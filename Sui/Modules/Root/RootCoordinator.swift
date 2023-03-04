//
//  RootCoordinator.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct RootCoordinatorView: View {
    
    let store: StoreOf<RootCoordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) {
                CaseLet(
                    state: /RootSharedStore.State.signIn,
                    action: RootSharedStore.Action.signIn,
                    then: SignInCoordinatorView.init
                )
                CaseLet(
                    state: /RootSharedStore.State.tab,
                    action: RootSharedStore.Action.tab,
                    then: TabCoordinatorView.init
                )
            }
        }
    }
    
}

// MARK: - Coordinator

struct RootCoordinator: ReducerProtocol {

    var body: some ReducerProtocol<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .signIn(.routeAction(_, action: .welcome(.goNext)))):
                state.routes.removeAll()
                state.routes.push(.tab(.initialState))
            default:
                break
            }
            return .none
        }.forEachRoute {
            RootSharedStore()
        }
    }
    
}

// MARK: - State

extension RootCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        
        var routes: IdentifiedArrayOf<Route<RootSharedStore.State>>
        
        init(isLoggedIn: Bool = false) {
            self.routes = isLoggedIn ?
            [.root(.tab(.initialState), embedInNavigationView: true)] :
            [.root(.signIn(.initialState), embedInNavigationView: true)]
        }
    }
    
}

// MARK: - Action

extension RootCoordinator {
    
    enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(RootSharedStore.State.ID, action: RootSharedStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<RootSharedStore.State>>)
    }
    
}
