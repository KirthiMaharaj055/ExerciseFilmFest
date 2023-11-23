//
//  MovieLibraryDataServiceTests.swift
//  ExerciseFilmFestTests
//
//  Created by Kirthi Maharaj on 2023/11/22.
//

import XCTest

@testable import ExerciseFilmFest
final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    
    let fantasy = Movie(title: "Fantasy")
    let horror =  Movie(title: "Horror")
    let thriller =  Movie(title: "Thriller")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManger = MovieManager()
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Sections
    func testTableViewSections_Count_ReturnTwo(){
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount(){
        sut.movieManger?.addMovie(movie: fantasy)
        sut.movieManger?.addMovie(movie: horror)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManger?.addMovie(movie: thriller)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesToSeenCount(){
        sut.movieManger?.addMovie(movie: fantasy)
        sut.movieManger?.addMovie(movie: thriller)
        sut.movieManger?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManger?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMoviesCell(){
        sut.movieManger?.addMovie(movie: horror)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeuedCell(){
    
        sut.movieManger?.addMovie(movie: horror)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
        
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        
        sut.movieManger?.addMovie(movie: fantasy)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fantasy)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        sut.movieManger?.addMovie(movie: fantasy)
        sut.movieManger?.addMovie(movie: thriller)
        
        sut.movieManger?.checkOffMovieAtIndex(index: 0)
        
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fantasy)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManger?.addMovie(movie: thriller)
        sut.movieManger?.addMovie(movie: horror)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManger?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManger?.moviesToSeeCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
}


