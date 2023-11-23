//
//  ViewController.swift
//  ExerciseFilmFest
//
//  Created by Kirthi Maharaj on 2023/11/16.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Thriller", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Comedy"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Fantasy"))
        
        libraryTableView.reloadData()
    }


}

