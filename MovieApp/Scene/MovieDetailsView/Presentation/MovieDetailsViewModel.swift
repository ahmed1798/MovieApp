//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation
import Combine

//MARK: - MOVIEW LIST VIEW MODEL
final class MovieDetailsViewModel: ObservableObject {
    
    @Published var movieDetails: MovieDetailsEntity?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let useCases: MovieDetailsUseCaseProtocol
    private var anyCancellable = Set<AnyCancellable>()
    
    init(useCases: MovieDetailsUseCaseProtocol = MovieDetailsUseCases()) {
        self.useCases = useCases
    }
    
    // MARK: - FETCH MOVIE DETAILS
    func fetchMovieDetails(id: Int) {
        isLoading = true
        useCases.fetchMovieDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] details in
                guard let self = self else { return }
                self.movieDetails = details
            }.store(in: &anyCancellable)
    }
}
