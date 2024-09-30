//
//  MoviesViewModel.swift
//  test
//
//  Created by Saranvignesh Soundararajan on 14/08/23.
//

import Foundation

class MovieDataModel: ObservableObject {
    @Published var moviesList: [MovieModel] = []
}
