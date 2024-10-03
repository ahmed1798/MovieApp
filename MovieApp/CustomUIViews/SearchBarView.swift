//
//  SearchBarView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//


import SwiftUI
struct SearchBar: View {
    // MARK: - PROPERTIES
    @Binding var text: String
    
    // MARK: - BODY
    var body: some View {
        
        HStack { //: START HSTACK
            TextField("Search TMDB", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack { //: START HSTACK
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    } //: END HSTACK
                )
        } //: END HSTACK
    }
}

// MARK: - PREVIEW
#Preview {
    @Previewable @State var text: String = ""
    SearchBar(text: $text)
        .environment(\.colorScheme, .dark)
}
