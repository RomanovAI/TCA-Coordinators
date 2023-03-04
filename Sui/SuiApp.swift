//
//  SuiApp.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct SuiApp: App {
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(store: .init(
                initialState: .init(),
                reducer: RootCoordinator()
                    ._printChanges()
            ))
        }
    }
}
