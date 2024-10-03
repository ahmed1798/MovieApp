//
//  GenreChip.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

struct GenreChip: View {
    // MARK: - PROPERTIES
    let genre: GenreModel
    let isSelected: Bool
    
    // MARK: - BODY
    var body: some View {
        
        ZStack {
            Capsule()
                .stroke(.navTitle, lineWidth: 1.0)
                .frame(height: 40)
                .background(isSelected ? .navTitle : .black)
                .cornerRadius(20)
            
            Text(genre.name ?? "")
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .font(.headline)
                .foregroundColor(isSelected ? Color.black : Color.white)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    GenreChip(genre: GenreModel(id: 1, name: "Action"), isSelected: true)
        .padding()
}
