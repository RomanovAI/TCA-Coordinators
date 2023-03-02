//
//  TodoSharedCoordinator.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct TodoSharedCoordinator: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .routeAction(_, action: .list(.buttonTapped)):
                state.routes.push(.detail(.initialState))
            default:
                break
            }
            return .none
        }.forEachRoute {
            TodoSharedStore()
        }
    }
    
}

// MARK: - State

extension TodoSharedCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        
        static let initialState = State(
            routes: [.root(.list(.initialState), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<TodoSharedStore.State>>
    }
    
}

// MARK: - Action

extension TodoSharedCoordinator {
    
    enum Action: IdentifiedRouterAction {
        case routeAction(TodoSharedStore.State.ID, action: TodoSharedStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<TodoSharedStore.State>>)
    }
    
}
