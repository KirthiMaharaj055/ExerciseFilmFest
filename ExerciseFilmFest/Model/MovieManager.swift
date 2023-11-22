//
//  MovieManager.swift
//  ExerciseFilmFest
//
//  Created by Kirthi Maharaj on 2023/11/21.
//

import Foundation

class MovieManager{
    
    var moviesToSeeCount: Int { return moviesToSeeArray.count}
    var moviesToSeenCount: Int { return moviesSeenArray.count}
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie) {
        if !moviesToSeeArray.contains(movie)
        {
            moviesToSeeArray.append(movie)
        }
        
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int) {
        guard index < moviesToSeeCount else {return}
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func clearArray(){
        moviesSeenArray.removeAll()
        moviesToSeeArray.removeAll()
    }
}
