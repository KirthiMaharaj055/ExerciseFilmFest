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
        sut.movieManager = MovieManager()
        
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
//        sut.movieManager?.addMovie(movie: fantasy)
//        sut.movieManager?.addMovie(movie: horror)
//        
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//        
//        sut.movieManager?.addMovie(movie: thriller)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesToSeenCount(){
        /*sut.movieManager?.addMovie(movie: fantasy)
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()*/
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMoviesCell(){
        sut.movieManager?.addMovie(movie: horror)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeuedCell(){
    
        sut.movieManager?.addMovie(movie: horror)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
        
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData(){
        
        sut.movieManager?.addMovie(movie: fantasy)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fantasy)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        sut.movieManager?.addMovie(movie: fantasy)
        sut.movieManager?.addMovie(movie: thriller)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, fantasy)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.addMovie(movie: horror)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
    
}


