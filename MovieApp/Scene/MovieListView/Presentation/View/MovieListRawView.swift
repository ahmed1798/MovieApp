//
//  MoviewListRawView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

struct MovieListRawView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = MovieListViewModel()
    @State var showingDetails = false
    @State var selectedMovie: MovieModel?
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) { //: START VSTACK
            
            if !showingDetails {
                SearchBar(text: $viewModel.searchText)
                
                Text("Watch New Movies").textModifier(fontSize: 24, fontWeight: .heavy, foregroundColor: .navTitle)
                    .padding(.leading, 12)
            }
            
            NavigationView { //: START NAVIGATION
                
                VStack(spacing: 12) { //: START VSTACK
                    
                    GenreFilteredView(genres: viewModel.genres, selectedGenre: $viewModel.selectedGenres)
                    
                    MovieGridView(viewModel: viewModel, showingDetails: $showingDetails,
                                  selectedMovie: $selectedMovie, movies: viewModel.filteredMovies)
                    
                        .onAppear { //: START ON APPEAR
                            viewModel.loadMoviesData()
                        }//: END ON APPEAR
                    
                        .overlay( //: START OVERLAY FOR LOADING AND ERROR MESSAGE
                            
                            Group { //: START GROUP THAT CONTAINS LOADER AND ERROR MESSAGE
                                if viewModel.isLoading {
                                    Loader()
                                } else if let errorMessage = viewModel.errorMessage {
                                    Text(errorMessage)
                                        .padding()
                                }
                            } //: END GROUP
                            
                        ) //: END OVERLAY
                    
                } //: END VSTACK
        
                .background(
                    NavigationLink(destination: MovieDetailsView(id: selectedMovie?.id ?? 0), isActive: $showingDetails) {
                        EmptyView()})
            } //: END NAVIGATION
            
        } //: END VSTACK
        .background()
    }
}

// MARK: - PREVIEW
#Preview {
    MovieListRawView()
        .environment(\.colorScheme, .dark)
}

