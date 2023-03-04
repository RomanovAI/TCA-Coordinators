//
//  ProfileCoordinator.swift
//  sui
//
//  Created by Артем Романов on 03.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct ProfileCoordinatorView: View {
    
  let store: StoreOf<ProfileCoordinator>

  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) {
        CaseLet(
          state: /ProfileSharedStore.State.profile,
          action: ProfileSharedStore.Action.profile,
          then: ProfileScreen.init
        )
      }
    }
  }
    
}

// MARK: - Coordinator

struct ProfileCoordinator: ReducerProtocol {
    
    var body: some ReducerProtocol<State, Action> {
        return Reduce<State, Action> { state, action in
            switch action {
          
            default:
                break
            }
            return .none
        }.forEachRoute {
            ProfileSharedStore()
        }
    }
    
}

// MARK: - State

extension ProfileCoordinator {
    
    struct State: Equatable, IdentifiedRouterState {
        static let initialState = State(
            id: UUID(),
            routes: [.root(.profile(.initialState), embedInNavigationView: true)]
        )
        var id: UUID
        var routes: IdentifiedArrayOf<Route<ProfileSharedStore.State>>
    }
    
}


// MARK: - Action

extension ProfileCoordinator {
    
    enum Action: Equatable, IdentifiedRouterAction {
        case routeAction(ProfileSharedStore.State.ID, action: ProfileSharedStore.Action)
        case updateRoutes(IdentifiedArrayOf<Route<ProfileSharedStore.State>>)
    }
    
}


