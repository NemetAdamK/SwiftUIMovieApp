//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var movies = [Movie]()

    func fetchMovies(searchText : String)
    {
        MovieService.sharedInstance.fetchPopularMoviesData(searchText: searchText, completion: { result in
            self.movies = result
        })
    }

}
