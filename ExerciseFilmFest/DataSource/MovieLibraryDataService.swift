//
//  MovieLibraryDataService.swift
//  ExerciseFilmFest
//
//  Created by Kirthi Maharaj on 2023/11/22.
//

import UIKit

enum LibrarySection: Int {
    case MoviesSee
    case MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManger = movieManager else { return 0 }
        
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection {
        case .MoviesSee:
            return movieManger.moviesToSeeCount
        case .MoviesSeen:
            return movieManger.moviesToSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager = movieManager else {fatalError()}
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError()}
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        
        cell.configMovieCell(movie: movieData)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else {
            fatalError()
        }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        if librarySection == .MoviesSee {
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else {fatalError()}
        
        let sectionTitle = librarySection.rawValue == 0 ? "Movies See" : "Movies Seen"
        
        return sectionTitle
    }
    
}
