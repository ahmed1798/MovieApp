//
//  ContentView.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        MovieListRawView()
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
        .environment(\.colorScheme, .dark)
}
