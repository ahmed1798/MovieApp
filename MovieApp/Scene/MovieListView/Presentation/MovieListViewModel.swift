//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation
import Combine

//MARK: - MOVIEW LIST VIEW MODEL
final class MovieListViewModel: ObservableObject {
    
    @Published var genres: GenreList = []
    @Published var movies: MovieList = []
    @Published var filteredMovies: MovieList = []
    @Published var searchText: String = ""
    @Published var pathURL: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    @Published var selectedGenres: GenreModel? {
        didSet {
            fetchMoviewWithFilteredGenre()
        }
    }
    
    private let useCases: MovieListUseCaseProtocol
    private var anyCancellable = Set<AnyCancellable>()
    private var currentPage: Int = 1
    private var lastPage: Int?
    private var fetchingData = false
    
    init(useCases: MovieListUseCaseProtocol = MovieListUseCases()) {
        self.useCases = useCases
    }
    
    // MARK: - LOAD MOVIE DATA
    func loadMoviesData() {
        fetchGenres()
        fetchTrendingMovies(page: currentPage)
        setupSearch()
    }
    
    // MARK: - FETCH MOVIES WHEN WITH FILTERED GENRES
    func fetchMoviewWithFilteredGenre() {
        movies = []
        filteredMovies = []
        currentPage = 1
        fetchTrendingMovies(page: currentPage)
    }
    
    // MARK: - FETCH GENRES
    func fetchGenres() {
        useCases.fetchGenres()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] genres in
                guard let self = self else { return }
                self.genres = genres.genres ?? []
            }.store(in: &anyCancellable)
    }
    
    // MARK: - FETCH TRENDING MOVIES
    func fetchTrendingMovies(page: Int) {
        isLoading = true
        if let genreId = selectedGenres?.id {
            pathURL = "&with_genres=\(genreId)"
        }
        useCases.fetchTrendingMovies(page: page, pathURL: pathURL)
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
            } receiveValue: { [weak self] movies in
                guard let self = self else { return }
                self.lastPage = movies.totalPages ?? 0
                self.currentPage += 1
                self.movies.append(contentsOf: movies.results ?? [])
                self.filteredMovies = self.movies
            }.store(in: &anyCancellable)
    }
    
    // MARK: - SEARCH IN MOVIES LIST BY TITLE
    private func setupSearch() {
        $searchText
            .receive(on: DispatchQueue.main)
            .sink {_ in
                
            } receiveValue: { [weak self] text in
                guard let self = self else { return }
                text == "" ? (self.filteredMovies = self.movies) : (self.filteredMovies = self.movies.filter { (($0.title?.range(of: text, options: .caseInsensitive)) != nil) })
            }.store(in: &anyCancellable)
    }
    
    // MARK: - LOAD MORE MOVIES BY HANDLING PAGINATION
    func paginationMovies(currentItem movie: MovieModel) {
        let index = movies.index(movies.endIndex, offsetBy: -5)
        if movies.firstIndex(where: { $0.id == movie.id }) == index {
            fetchTrendingMovies(page: currentPage)
        }
    }
}
