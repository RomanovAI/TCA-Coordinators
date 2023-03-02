//
//  SuiApp.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI

@main
struct SuiApp: App {
    var body: some Scene {
        WindowGroup {
                AppScreen(store: .init(
                    initialState: .initialState,
                    reducer: AppCoordinator()
                        ._printChanges()
                ))
        }
    }
}
