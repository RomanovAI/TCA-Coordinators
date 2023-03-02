//
//  AppScreen.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct AppScreen: View {
    
    let store: StoreOf<AppCoordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) {
                CaseLet(
                    state: /AppStore.State.authorization,
                    action: AppStore.Action.authorization,
                    then: AuthorizationScreen.init
                )
                CaseLet(
                    state: /AppStore.State.main,
                    action: AppStore.Action.main,
                    then: MainTabScreen.init
                )
            }
        }
    }
    
}
