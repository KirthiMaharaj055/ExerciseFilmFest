//
//  ViewController.swift
//  ExerciseFilmFest
//
//  Created by Kirthi Maharaj on 2023/11/16.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataSource: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.libraryTableView.dataSource = dataSource
        self.libraryTableView.delegate = dataSource
    }


}

