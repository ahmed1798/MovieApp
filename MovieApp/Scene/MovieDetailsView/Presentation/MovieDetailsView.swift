//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = MovieDetailsViewModel()
    var id: Int
    
    // MARK: - BODY
    var body: some View {
        
        let movieDetails = viewModel.movieDetails
        
        ScrollView(.vertical, showsIndicators: false) { //: START SCROLL
            
            VStack(alignment: .leading, spacing: 8) { //: START VSTACK
                
                // MOVIE IMAGE
                LoadImage(imageURL: "https://image.tmdb.org/t/p/w500\(movieDetails?.backdropPath ?? "")", cornerRadius: 0)
                // .frame(maxWidth: .infinity, minHeight: 200)
                
                HStack(spacing: 16) { //: START HSTACK
                    LoadImage(imageURL: "https://image.tmdb.org/t/p/w500\(viewModel.movieDetails?.backdropPath ?? "")", cornerRadius: 2)
                        .frame(maxWidth: 100, maxHeight: 300)
                    
                    VStack(alignment: .leading, spacing: 12) { //: START VSTACK
                        // RELEASE DATE
                        HStack { //: START HSTACK
                            //: TITLE
                            Text(movieDetails?.title ?? "")
                                .textModifier(fontSize: 14, fontWeight: .heavy, foregroundColor: .white)
                            
                            //: RELEASE DATE
                            Text("(\(movieDetails?.releaseDate ?? ""))")
                                .textModifier(fontSize: 14, fontWeight: .heavy, foregroundColor: .white)
                        } //: END HSTACK
                        
                        //: GENERES
                        Text("\(movieDetails?.genres?.map { $0.name ?? "" }.joined(separator: ", ") ?? "")")
                            .textModifier(fontSize: 12, fontWeight: .regular, foregroundColor: .white)
                        
                    } //: END VSTACK
                    
                } //: END HSTACK
                
                //: OVER VIEW
                Text(movieDetails?.overview ?? "")
                    .textModifier(fontSize: 14, fontWeight: .regular, foregroundColor: .white)
                
                Spacer()
                MovieDetailsSubTextView(movieDetails: movieDetails)
            } //: VSTACK
            
        } //: END SCROLLVIEW
        .background()
        
        .onAppear { //: START ON APPEAR
            viewModel.fetchMovieDetails(id: id)
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
    }
}

#Preview {
    MovieDetailsView(id: 1114513)
        .environment(\.colorScheme, .dark)
}
