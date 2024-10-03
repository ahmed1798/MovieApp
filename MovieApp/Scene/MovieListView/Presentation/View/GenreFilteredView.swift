//
//  GenreFilteredView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

struct GenreFilteredView: View {
    // MARK: - PROPERTIES
    var genres: GenreList
    @Binding var selectedGenre: GenreModel?
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) { //: START SCROLL
            
            HStack { //: START HSTACK
                
                ForEach(genres) { genre in //: START LOOP
                    let isSelected = (genre.id == selectedGenre?.id)
                    
                    GenreChip(genre: genre, isSelected: isSelected)
                        .onTapGesture { //: START ONTAPGESTURE
                            if selectedGenre?.id == genre.id {
                                selectedGenre = nil
                            } else {
                                selectedGenre = genre
                            }
                        } //: END ONTAPGESTURE
                    
                } //: END LOOP
                
            } //: END HSTACK
            
        } //: END SCROLL
    }
}

// MARK: - PREVIEW
#Preview {
    
    @Previewable @State var selectedGenre: GenreModel? = nil
    GenreFilteredView(genres:
                        [GenreModel(id: 1, name: "Action"),
                         GenreModel(id: 2, name: "Comedy")], selectedGenre: $selectedGenre)
    .padding()
}
