//
//  MovieListStore.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import Foundation
import ComposableArchitecture

struct MovieListStore: ReducerProtocol {
    
    @Dependency(\.movieService) private var movieService
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case .onAppear:
            if !state.isListEmpty {
                state.loadingState = .loaded
                return .none
            }
            state.loadingState = .loading
            
            return .task {
                await .getMoviesResponse(TaskResult { try await movieService.getMovies() })
            }
            
        case .refresh:
            return .task {
                await .getMoviesResponse(TaskResult { try await movieService.getMovies() })
            }
            
            
        case .getMoviesResponse(.success(let items)):
            state.loadingState = .loaded
            state.list = items
            state.displayedList = items
            return .none
            
        case .getMoviesResponse(.failure(_)):
            state.loadingState = .loaded
            return .none
            
        case .searchTextChanged(let text):
            state.searchText = text
            
            state.displayedList = text.isTrimmingEmpty ?
            state.list :
            state.list.filter { $0.name.localizedCaseInsensitiveContains(text) }
            
            state.isDisplayedListEmpty = state.displayedList.isEmpty
            return .none
            
        case .itemTapped(_):
            return .none
        }
    }
    
}

// MARK: - State

extension MovieListStore {
    
    struct State: Equatable {
        
        static let initialState = State(
            id: UUID(),
            list: .init(),
            displayedList: .init(),
            searchText: .init(),
            loadingState: .loading,
            isDisplayedListEmpty: false
        )
        
        let id: UUID
        var list: [MovieResponseModel]
        var displayedList: [MovieResponseModel]
        var searchText: String
        var loadingState: LoadingState
        var isDisplayedListEmpty: Bool
        
        var isListEmpty: Bool {
            list.isEmpty
        }
    
    }
    
}

// MARK: - LoadingState

extension MovieListStore.State {
    
    enum LoadingState: Equatable {
        case loaded
        case loading
        
        var isLoading: Bool { self == .loading }
    }
    
}

// MARK: - Action

extension MovieListStore {
    
    enum Action: Equatable {
        case onAppear
        
        case searchTextChanged(text: String)
        
        case itemTapped(MovieResponseModel)
        
        case getMoviesResponse(TaskResult<[MovieResponseModel]>)
        
        case refresh
    }
    
}
