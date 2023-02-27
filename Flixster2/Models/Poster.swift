//
//  Poster.swift
//
//  Created by Andrea Sanchez on 2/23/23.
//

import Foundation

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: URL
}
