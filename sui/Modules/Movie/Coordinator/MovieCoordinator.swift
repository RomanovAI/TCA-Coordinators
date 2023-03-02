//
//  MovieCoordinator.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct MovieCoordinatorView: View {
    
    let store: StoreOf<MovieCoordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) {
                CaseLet(
                    state: /MovieSharedStore.State.list,
                    action: MovieSharedStore.Action.list,
                    then: MovieListScreen.init
                )
                CaseLet(
                    state: /MovieSharedStore.State.detail,
                    action: MovieSharedStore.Action.detail,
                    then: MovieDetailScreen.init
                )
            }
        }
    }
    
}

// MARK: - Coordinator

struct MovieCoordinator: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .list(.itemTapped(let item))):
                state.routes.push(.detail(.init(id: .init(), movie: item)))
            default:
                break
            }
            return .none
        }.forEachRoute {
            MovieSharedStore()
        }
    }
    
}

// MARK: - State

extension MovieCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        static let initialState = State(
            id: UUID(),
            routes: [.root(.list(.initialState), embedInNavigationView: true)]
        )
        var id: UUID
        var routes: IdentifiedArrayOf<Route<MovieSharedStore.State>>
    }
    
}

// MARK: - Action

extension MovieCoordinator {
    
    enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(MovieSharedStore.State.ID, action: MovieSharedStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<MovieSharedStore.State>>)
    }
    
}
