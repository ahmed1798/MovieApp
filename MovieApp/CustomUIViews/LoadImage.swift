//
//  LoadImage.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI


struct LoadImage: View {
    // MARK: - PROPERTIES
    var imageURL: String = ""
    var cornerRadius: CGFloat = 0.0
    
    // MARK: - BODY
    var body: some View { //: START BODY
        
        // MARK: - DOWNLOAD IMAGE FROM URL WITH ANIMATION
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase { // VALID URL
            case .success(let image):
                image.imageModifier(opacity: 0.3, cornerRadius: cornerRadius)
                    .transition(.scale)
            case .failure(_): //...INVALID URL
                Image(systemName: "ant.circle.fill").iconModifier( maxWidth: 60, color: .gray, opacity: 0.3)
            case .empty: //...EMPTY
                Image(systemName: "photo.circle.fill").iconModifier(maxWidth: 60, color: .gray, opacity: 0.3)
                @unknown default:
                ProgressView()
            }
        }
    } //: END BODY
}

// MARK: - PREVIEW
#Preview {
    LoadImage()
}

