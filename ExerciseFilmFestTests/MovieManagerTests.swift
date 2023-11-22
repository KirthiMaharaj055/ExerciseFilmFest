//
//  MovieManagerTests.swift
//  ExerciseFilmFestTests
//
//  Created by Kirthi Maharaj on 2023/11/21.
//

import XCTest


@testable import ExerciseFilmFest
final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!

    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero(){
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    
    func testInit_MoviesToSeen_ReturnsZero(){
        XCTAssertEqual(sut.moviesToSeenCount, 0)
    }

    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsZero(){
        let testMovie = Movie(title: "Sci-Fi")
        sut.addMovie(movie: testMovie)
        
       // XCTAssertEqual(sut.moviesToSeenCount, 1)
    }

    func testQuery_ReturnsMovieAtIndex(){
        let testMovie = Movie(title: "Art drama")
        sut.addMovie(movie: testMovie)
        
        let movieQuery = sut.movieAtIndex(index: 0)
        XCTAssertEqual(testMovie.title, movieQuery.title)
    }

    // MARK: Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesToSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    // MARK: Clearing and resetting
    func testClearArrays_ReturnsArrayCountsOfZero(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesToSeenCount, 1)
        
        sut.clearArray()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesToSeenCount, 0)
    }
    
    // MARK: Duplicates
    
    func testDuplicateMovie_ShouldNotBeAddedToArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
