//
//  TodoSharedScreen.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct TodoSharedScreen: View {
    
  let store: StoreOf<TodoSharedCoordinator>

  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) {
        CaseLet(
          state: /TodoSharedStore.State.list,
          action: TodoSharedStore.Action.list,
          then: TodoListScreen.init
        )
        CaseLet(
          state: /TodoSharedStore.State.detail,
          action: TodoSharedStore.Action.detail,
          then: TodoDetailScreen.init
        )
      }
    }
  }
    
}
