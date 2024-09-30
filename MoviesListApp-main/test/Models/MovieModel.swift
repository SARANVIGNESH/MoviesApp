//
//  MovieModel.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 31/07/23.
//

import Foundation


struct MovieModel: Codable {
    let id = UUID()
    let movieName: String
    let movieImage: String
    let releaseDate: Int
    let matchPercent: String

    enum CodingKeys: String, CodingKey {
        case id
        case movieName = "movie_name"
        case movieImage = "movie_image"
        case releaseDate = "release_date"
        case matchPercent = "match_percent"
    }
}
