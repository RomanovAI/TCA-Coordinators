//
//  WelcomeScreen.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct WelcomeScreen: View {
    
    let store: StoreOf<WelcomeStore>
    
    // MARK: - Body
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                image
                
                title
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .task {
                viewStore.send(.onAppear)
            }
        }
    }
    
    // MARK: - Image
    
    private var image: some View {
        Image("imgEvening")
            .resizable()
    }
    
    // MARK: - Title
    
    private var title: some View {
        Text("Welcome")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
    
}
