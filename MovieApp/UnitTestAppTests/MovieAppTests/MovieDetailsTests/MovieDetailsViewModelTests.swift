//
//  MovieDetailsViewModelTests.swift
//  MovieAppTests
//
//  Created by Ahmed Eissa on 03/10/2024.
//

import XCTest
import Combine
@testable import MovieApp

final class MovieDetailsViewModelTests: XCTestCase {
    
    var sut: MovieDetailsViewModel!
    var mockUseCase: MockMovieDetailsUseCase!
    var anyCancellable: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockMovieDetailsUseCase()
        sut = MovieDetailsViewModel(useCases: mockUseCase)
        anyCancellable = []
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockUseCase = nil
        anyCancellable = nil
    }
    
    // MARK: -  Test Fetch Movie List With Success Data
    func testFetchMovieDetails_WithSuccessData_ShouldReturnSuccess() {
        
        //: ARRANGE
        let expectation = self.expectation(description: "Fetch Movie Details With Success Data")
        
        //: ACT
        sut.fetchMovieDetails(id: 1114513)
        
        //: ASSERT
        sut.$movieDetails.dropFirst()
            .sink { movie in
                XCTAssertEqual(movie?.title, "Speak No Evil")
                XCTAssertEqual(movie?.revenue, 57652430)
                XCTAssertEqual(movie?.runtime, 110)
                expectation.fulfill()
            }
            .store(in: &anyCancellable)
        
        self.wait(for: [expectation], timeout: 5.0)
    }
    
    // MARK: - Test Fetch Movie List When Invalid URL
    func testFetchMovieList_WithInvalidURL_ShouldReturnFailure() {
        
        //: ARRANGE
        let expectation = XCTestExpectation(description: "Fetch Movie List With Invalid URL Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .invalidURL
        
        //: ACT
        sut.fetchMovieDetails(id: 1114513)
        
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
        let expectation = XCTestExpectation(description: "Fetch Genres With Other Error")
        mockUseCase.shouldReturnError = true
        mockUseCase.errorType = .other(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Internal Server Error"]))
        
        //: ACT
        sut.fetchMovieDetails(id: 1114513)
        
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
