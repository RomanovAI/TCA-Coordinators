//
//  AuthorizationScreen.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct AuthorizationScreen: View {
    
    let store: StoreOf<AuthorizationStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 20) {
                
                makeLogin(with: viewStore)
                
                makePassword(with: viewStore)
                
                
                Spacer()
                
                makeButton(with: viewStore)
            }
            .defaultPadding()
        }
        .navigationTitle("Authorization")
    }
    
    private func makeLogin(with viewStore: ViewStore<AuthorizationStore.State, AuthorizationStore.Action>) -> some View {
        Group {
            Text("Login")
            
            CustomTextField(
                placeholder: "Input login",
                text: .init(
                    get: { viewStore.loginText },
                    set: { viewStore.send(.loginTextChanged(text: $0))
                    }
                )
            )
        }
    }
    
    private func makePassword(with viewStore: ViewStore<AuthorizationStore.State, AuthorizationStore.Action>) -> some View {
        Group {
            Text("Password")
            
            CustomTextField(
                placeholder: "Input password",
                text: .init(
                    get: { viewStore.passwordText },
                    set: { viewStore.send(.passwordTextChanged(text: $0)) }
                )
            )
        }
    }
    
    private func makeButton(with viewStore: ViewStore<AuthorizationStore.State, AuthorizationStore.Action>) -> some View {
        Button {
            viewStore.send(.buttonTapped)
        } label: {
            Text("Login")
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: 300, height: 50)
                }
        }
        .frame(maxWidth: .infinity, alignment: .center)

    }
    
}
