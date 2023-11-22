//
//  ExerciseFilmFestTests.swift
//  ExerciseFilmFestTests
//
//  Created by Kirthi Maharaj on 2023/11/16.
//

import XCTest
@testable import ExerciseFilmFest

final class ExerciseFilmFestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    
    // MARK: Initialization
    func testInit_MovieWithTitle(){
        let testmovie = Movie(title: "Generic Blockbuster")
        XCTAssertNotNil(testmovie)
        XCTAssertEqual(testmovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate(){
        let testMovie = Movie(title: "Comedy", releaseDate: "1995")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1995")
    }
    
    
  // MARK: Equatable
    func testEquatable_RerurnsTrue(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnNotEqualForDifferentTitles(){
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnNotEqualForDifferentReleaseDates(){
        let actionMovie1 = Movie(title: "Action", releaseDate: "1978")
        let actionMovie2 = Movie(title: "Adventure", releaseDate: "1988")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    // MARK: 

}
