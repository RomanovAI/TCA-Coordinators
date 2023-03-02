//
//  MovieDetailScreen.swift
//  sui
//
//  Created by Артем Романов on 02.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct MovieDetailScreen: View {
    
    typealias Store = ViewStore<MovieDetailStore.State, MovieDetailStore.Action>
    
    let store: StoreOf<MovieDetailStore>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(alignment: .leading, spacing: 40) {
                    makeDescriptionView(with: viewStore)
                    
                    makeRatingView(with: viewStore)
                    
                    Spacer()
                }
                .defaultPadding()
                .navigationTitle(viewStore.movie.name)
                .hiddenTabView()
            }
        }
        
    }
    
    // MARK: - Description
    
    private func makeDescriptionView(with viewStore: Store) -> some View {
        Text(viewStore.movie.description)
    }
    
    // MARK: - Rating
    
    private func makeRatingView(with viewStore: Store) -> some View {
        RatingView(rating: viewStore.movie.rating)
    }
    
}
