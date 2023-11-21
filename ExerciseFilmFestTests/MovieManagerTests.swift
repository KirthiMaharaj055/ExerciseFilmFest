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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_MoviesToSee_ReturnsZero(){
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesToSeen_ReturnsZero(){
        XCTAssertEqual(sut.moviesToSeenCount, 0)
    }


}
