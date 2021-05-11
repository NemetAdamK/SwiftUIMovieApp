//
//  MovieService.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//


import Foundation

class MovieService {
    
    static let sharedInstance: MovieService = {
        let instance = MovieService()
        return instance
    }()
    
    func fetchPopularMoviesData(searchText: String,completion: @escaping ([Movie]) -> ()){
        
        var url = ""
        if searchText == "" {
            url = DefaultKeys.k_popularMoviesURL
        } else {
            url = "\(DefaultKeys.k_searchedMoviesURL)\(searchText)"
        }
        
        guard let url = URL(string: url) else {return}
        ApiService.sharedInstance.getData(url) { (result: Result<MoviesData, Error>) in
            switch result {
            case .success(let listOf):
                completion(listOf.movies)
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
}

