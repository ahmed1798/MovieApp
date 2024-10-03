//
//  MovieGridView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

struct MovieGridView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel: MovieListViewModel
    @Binding var showingDetails: Bool
    @Binding var selectedMovie: MovieModel?
    
    var movies: MovieList = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - BODY
    var body: some View {
        Spacer()
        ScrollView { //: START SCROLL
            
            LazyVGrid(columns: columns, spacing: 10) { //: START GRID
                ForEach(movies) { movie in //: START LOOP
                    
                        VStack(alignment: .leading, spacing: 8) { //: START VSTACK
                            
                            //: MOVIE IMAGE
                            LoadImage(imageURL: "https://image.tmdb.org/t/p/w500\(movie.backdropPath ?? "")", cornerRadius: 8)
                            
                            //: MOVIE TITLE
                            Text(movie.title ?? "")
                                .textModifier(fontSize: 16, fontWeight: .medium, foregroundColor: .white)
                            
                            //: MOVIE RELEASE DATE
                            Text(movie.releaseDate ?? "")
                                .textModifier(fontSize: 14, fontWeight: .regular, foregroundColor: .white)
                            
                        } //: END VSTACK
                    
                        .onTapGesture {
                            selectedMovie = movie
                            showingDetails = true
                        }
                    
                    .onAppear {
                        // Load more movies when reaching the end of the list
                        viewModel.paginationMovies(currentItem: movie)
                    }
                    
                } //: END LOOP
                
            } //: END GRID
            .padding(.horizontal)
            
        } //: END SCROLL
    }
}

// MARK: - PREVIEW
#Preview {
    @Previewable @State var selectedMovie: MovieModel? = nil
    @Previewable @State var showingDetails: Bool = false
    
    MovieGridView(viewModel: MovieListViewModel(), showingDetails: $showingDetails, selectedMovie: $selectedMovie)
        .padding()
}
