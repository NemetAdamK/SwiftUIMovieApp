//
//  CommonDefines.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import Foundation

class DefaultKeys {
    
    static let k_DefaultValuesAreSet = "defaultValuesAreSet"
    static let k_movieDbApiKey = "749dafd209a5cacd255e8e3b15cb0104"
    static let k_popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(DefaultKeys.k_movieDbApiKey)"
    static let k_searchedMoviesURL = "https://api.themoviedb.org/3/search/movie?api_key=\(DefaultKeys.k_movieDbApiKey)&query="
}
