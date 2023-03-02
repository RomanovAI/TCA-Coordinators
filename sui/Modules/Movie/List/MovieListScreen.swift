//
//  MovieListScreen.swift
//  sui
//
//  Created by Артем Романов on 01.03.2023.
//

import SwiftUI
import ComposableArchitecture

struct MovieListScreen: View {
    
    typealias Store = ViewStore<MovieListStore.State, MovieListStore.Action>
    
    let store: StoreOf<MovieListStore>
    
    // MARK: - Body
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                if viewStore.loadingState.isLoading {
                    Loader()
                } else {
                    makeContent(with: viewStore)
                }
                
                Spacer()
            }
            .navigationTitle("Movies")
            .task { viewStore.send(.onAppear) }
            .showTabView()
        }
    }
    
    // MARK: - Content
    
    private func makeContent(with viewStore: Store) -> some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header: makeSearchTextField(with: viewStore)) {
                    if viewStore.isDisplayedListEmpty {
                        emptyView
                    } else {
                        ForEach(viewStore.state.displayedList, id: \.self) {
                            makeItem($0, viewStore: viewStore)
                                .padding(.bottom, 6)
                                .padding(.horizontal, 16)
                        }
                    }
                }
            }
        }
        .refreshable {
            viewStore.send(.refresh)
        }
    }
    
    // MARK: - Search text field
    
    private func makeSearchTextField(with viewStore: Store) -> some View {
        StandardTextField(
            placeholder: "Search",
            text: .init(
                get: { viewStore.searchText },
                set: { viewStore.send(.searchTextChanged(text: $0)) }
            )
        )
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - Item
    
    private func makeItem(_ item: MovieResponseModel, viewStore: Store) -> some View {
        Button {
            viewStore.send(.itemTapped(item))
        } label: {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(height: 64)
                .shadow(
                    color: .secondary.opacity(0.44),
                    radius: 4,
                    x: 0,
                    y: 2
                )
                .overlay(alignment: .leading) {
                    makeItemContent(item)
                }
        }
    }
    
    // MARK: - Item content
    
    private func makeItemContent(_ item: MovieResponseModel) -> some View {
        HStack {
            Text(item.name)
                .foregroundColor(.black)
            
            Spacer()
            
            Image("icArrowRight")
                .foregroundColor(.black)
                .frame(width: 32, height: 32)
        }
        .padding(.leading, 16)
        .padding(.trailing, 29)
    }
    
    // MARK: - Empty
    
    private var emptyView: some View {
        Text("Nothing found. Try something else?")
            .frame(height: UIScreen.main.bounds.size.height / 2)
            .font(.body)
            .foregroundColor(.purple)
    }

}
