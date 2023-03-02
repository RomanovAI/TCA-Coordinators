//
//  AppCoordinator.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct AppCoordinator: ReducerProtocol {

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .routeAction(_, action: .authorization(.buttonTapped)):
                state.routes.push(.main(.initialState))
            default:
                break
            }
            return .none
        }.forEachRoute {
            AppStore()
          }
    }
    
}

// MARK: - State

extension AppCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        
        static let initialState = State(
            routes: [.root(.authorization(.initialState), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<AppStore.State>>
    }
    
}

// MARK: - Action

extension AppCoordinator {
    
    enum Action: IdentifiedRouterAction {
        case routeAction(AppStore.State.ID, action: AppStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<AppStore.State>>)
    }
    
}
