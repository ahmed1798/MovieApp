//
//  MovieListViewModelTests.swift
//  MovieAppTests
//
//  Created by Ahmed Eissa on 03/10/2024.
//

import XCTest
import Combine
@testable import MovieApp

final class MovieListViewModelTests: XCTestCase {

    var sut: MovieListViewModel!
    var mockUseCase: MockMovieListUseCase!
    var anyCancellable: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockMovieListUseCase()
        sut = MovieListViewModel(useCases: mockUseCase)
        anyCancellable = []
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockUseCase = nil
        anyCancellable = nil
    }
    
    // MARK: -  Test Fetch Genres With Success Data
    func testFetchGenres_WithSuccessData_ShouldReturnSuccess() {
        
        //: ARRANGE
        let expectation = self.expectation(description: "Fetch Genres With Success Data")
        
        //: ACT
        sut.fetchGenres()
        
        //: ASSERT
        sut.$genres.dropFirst()
            .sink { genres in
                XCTAssertEqual(genres.count, 1)
                XCTAssertEqual(genres.first?.name, "Action")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        self.wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: -  Test Fetch Movie List With Success Data
    func testFetchMovieList_WithSuccessData_ShouldReturnSuccess() {
        
        //: ARRANGE
        let expectation = self.expectation(description: "Fetch Movie List With Success Data")
        
        //: ACT
        sut.fetchTrendingMovies(page: 1)
        
        //: ASSERT
        sut.$movies.dropFirst()
            .sink { movie in
                XCTAssertEqual(movie.count, 1)
                XCTAssertEqual(movie.first?.title, "Deadpool & Wolverine")
                XCTAssertEqual(movie.first?.releaseDate, "2024-07-24")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        self.wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: - Test Fetch Genres When Invalid URL
    func testFetchGenres_WithInvalidURL_ShouldReturnFailure() {
        
        //: ARRANGE
        let expectation = XCTestExpectation(description: "Fetch Genres With Invalid URL Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .invalidURL
        
        //: ACT
        sut.fetchGenres()
        
        //: ASSERT
        sut.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Invalid URL")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    //MARK: - Test Fetch Genres With Other Error
    func testFetchGenres_WithOtherError_ShouldReturnFailure() {
        
        //: ARRANGE
        let expectation = XCTestExpectation(description: "Fetch Genres With Other Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .other(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Internal Server Error"]))
        
        //: ACT
        sut.fetchGenres()
        
        //: ASSERT
        sut.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Internal Server Error")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: - Test Fetch Movie List When Invalid URL
    func testFetchMovieList_WithInvalidURL_ShouldReturnFailure() {
        
        //: ARRANGE
        let expectation = XCTestExpectation(description: "Fetch Movie List With Invalid URL Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .invalidURL
        
        //: ACT
        sut.fetchTrendingMovies(page: 1)
        
        //: ASSERT
        sut.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Invalid URL")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    //MARK: - Test Fetch Movie List With Other Error
    func testFetchMovieList_WithOtherError_ShouldReturnFailure() {
        
        //: ARRANGE
        let expectation = XCTestExpectation(description: "Fetch Movie List With Other Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .other(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Internal Server Error"]))
        
        //: ACT
        sut.fetchTrendingMovies(page: 1)
        
        //: ASSERT
        sut.$errorMessage
            .dropFirst()
            .sink { errorMessage in
                XCTAssertEqual(errorMessage, "Internal Server Error")
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        wait(for: [expectation], timeout: 5.0)
    }
}
