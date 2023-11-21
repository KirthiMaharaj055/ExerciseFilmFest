//
//  Movie.swift
//  ExerciseFilmFest
//
//  Created by Kirthi Maharaj on 2023/11/16.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
