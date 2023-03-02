//
//  MainTabCoordinator.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

//import Foundation
//import ComposableArchitecture
//import TCACoordinators
//
//struct MainTabCoordinator: ReducerProtocol {
//    
//    var body: some ReducerProtocol<State, Action> {
//        Reduce { state, action in
//            switch action {
//            default:
//                break
//            }
//            return .none
//        }
//    }
//    
//}
//
//extension MainTabCoordinator {
//    
//    struct State: Equatable, IdentifiedRouterState {
//        
//        static let initialState = State(
//            routes: [.root(.todoList(.initialState))]
//        )
//        
//        var routes: IdentifiedArrayOf<Route<MainTabStore.State>>
//    }
//    
//}
//
//extension MainTabCoordinator {
//    
//    enum Action: IdentifiedRouterAction {
//        case routeAction(MainTabStore.State.ID, action: MainTabStore.Action)
//        case updateRoutes(IdentifiedArrayOf<Route<MainTabStore.State>>)
//        
//        
//    }
//    
//}
