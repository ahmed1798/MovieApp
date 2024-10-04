# MovieApp

This is a SwiftUI application that fetches and displays the most popular movies. The application is structured using the MVVM-C archeticture pattern and includes list of movies and detail view.
## Features

- Fetches genres from API.
- Displays a list of movies with titles, release date and images.
- Shows detailed information about a movie, including a full-width image, title, The year and the month of release date, genres, overview, homepage, budget, revenue, spoken languages, status and runtime
- Uses the MVVM-C architecture for clean and maintainable code.

## Requirements

- iOS 15.0+
- Xcode 12.0+
- Swift 5.0+
- Swift UI

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/ahmed1798/MovieApp
    ```
2. Open the project in Xcode:
    ```sh
    cd MovieApp
    open MovieApp.xcodeproj
    ```

## Usage

1. Replace the placeholder API key in `Constants.swift` with your valid API key:
    ```swift
    static let apiKey = "your-valid-api-key" // Replace with your valid API key
    ```

2. Build and run the project on the simulator or a physical device.

## Project Structure

The project follows the MVVM-C (Model-View-ViewModel-Clean) archeticture pattern:

- **Domain Layer**: Contains Repository Interface, UseCase and entities. 
- **Data Layer**: Contains RepositoryImplementation and Network. 
- **Presentation Layer**: Contains view models and views.

## Unit Testing

The project includes unit tests to ensure the functionality of the network layer and view models:

1. Open the Test navigator in Xcode (⌘ + 6).
2. Run the tests by pressing the play button next to the test suite or individual tests.

### Unit Tests

- **ViewModel Tests**: Tests for `MovieListViewModel, MovieDetailsViewModel` to ensure it correctly fetches and processes data.
- **Repository Tests**: Tests for `MovieListUseCase, MovieDetailsUseCase` to ensure it correctly interacts with the data source.
