//
//  MovieModel.swift
//  MovieApp
//
//  Created by Ádám-Krisztián Német on 11.05.2021.
//

import Foundation

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable, Identifiable {
    
    let title: String?
    let id: Double?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    let key: Double?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview, id, key
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
