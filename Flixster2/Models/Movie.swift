//
//  Movie.swift
//

import Foundation

// TODO: Pt 1 - Create a Track model struct


struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: URL
    let backdrop_path: URL
    let vote_average: Double
    let vote_count: Int
    let popularity: Double

}

// TODO: Pt 1 - Create an extension with a mock tracks static var

struct MoviesResponse: Decodable {
    let results: [Movie]
//    let resultCount: Int
}

// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
