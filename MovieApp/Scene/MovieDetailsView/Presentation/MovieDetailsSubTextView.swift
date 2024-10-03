//
//  MovieDetailsSubTextView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import SwiftUI

struct MovieDetailsSubTextView: View {
    // MARK: - PROPERTEIS
    var movieDetails: MovieDetailsEntity?
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) { //: START VSTACK
            
            //: HOMEPAGE
            if let homepageURL = URL(string:  movieDetails?.homepage ?? "") {
                HStack {
                    Text("Homepage")
                        .textModifier(fontSize: 14, fontWeight: .bold, foregroundColor: .white)
                    Link(movieDetails?.homepage ?? "", destination: homepageURL)
                }
            }
            
            //: LANGUAGE
            SubTextView(title: "LANGUAGES", subTitle: "\(movieDetails?.spokenLanguages?.map { $0.name ?? "" }.joined(separator: ", ") ?? "")")
            
            HStack { //: START HSTACK
                
                //: STATUS
                SubTextView(title: "STATUS", subTitle: movieDetails?.status ?? "")
                
                Spacer()
                //: RUNTIME
                SubTextView(title: "Runtime", subTitle: "\(movieDetails?.runtime ?? 0) minutes")
                
            } //: END HSTACK
            
            HStack { //: START HSTACK
                //: BUDGET
                SubTextView(title: "Budget", subTitle: "\(movieDetails?.budget ?? 0) $")
                
                Spacer()
                //: REVENU
                SubTextView(title: "Revenu", subTitle: "\(movieDetails?.revenue ?? 0) $")
                
            } //: END HSTACK
            
        } //: END VSTACK
    }
}

// MARK: - PREVIEW
#Preview {
    MovieDetailsSubTextView()
}

struct SubTextView: View {
    // MARK: - PROPERTEIS
    var title: String = "Title"
    var subTitle: String = "Sub Title"
    
    // MARK: - BODY
    var body: some View {
        
        VStack(alignment: .leading) { //: START VSTACK
            
            HStack(spacing: 8) { //: START HSTACK
                Text(title + ":")
                    .textModifier(fontSize: 14, fontWeight: .bold, foregroundColor: .white)
                
                Text(subTitle)
                    .textModifier(fontSize: 14, fontWeight: .regular, foregroundColor: .white)
                    .padding(.horizontal, 0)
            } //: END VSTACK
            
        } //: END HSTACK
    }
}
