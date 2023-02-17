//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation

// TODO: Pt 1 - Create a Track model struct
struct Movie {
    let movieName: String
    let description: String
    let artworkUrl100: URL
    let backdropUrl100: URL
    // Detail properties
    let voteAverage: String
    let votes: String
    let popularity: String
}

// TODO: Pt 1 - Create an extension with a mock tracks static var
extension Movie {
//

    /// An array of mock movies
    static var mockTracks: [Movie]  = [
        Movie(movieName: "Black Panther: Wakanda Forever",
              description: "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
              artworkUrl100: URL(string:"https://api.streamchaser.tv/image/?size=w342&path=/sv1xJUazXeYqALzczSZ3O6nkH75.jpg")!,
              backdropUrl100: URL(string:"https://www.themoviedb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg")!,
              voteAverage: "7.5 Vote Average",
              votes: "3132 Votes",
              popularity: "4646.8 Popularity"),
        Movie(movieName: "M3GAN",
              description: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
              artworkUrl100: URL(string: "https://s3.amazonaws.com/nightjarprod/content/uploads/sites/193/2023/02/07140856/d9nBoowhjiiYc4FBNtQkPY7c11H-scaled.jpg")!,
              backdropUrl100: URL(string:"https://dka575ofm4ao0.cloudfront.net/pages-transactional_logos/retina/350927/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg")!,
              voteAverage: "7.5 Vote Average",
              votes: "1580 Votes",
              popularity: "1469.2 Popularity"),
        Movie(movieName: "Avatar: The Way of Water",
              description: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
              artworkUrl100: URL(string: "https://image.tmdb.org/t/p/original//t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!,
              backdropUrl100: URL(string:"https://cloudfront-us-east-1.images.arcpublishing.com/infobae/ZEYKAFJAUFHYXJLOKKLSEURI4Q.jpg")!,
              voteAverage: "7.7 Vote Average",
              votes: "5278 Votes",
              popularity: "1234.4 Popularity"),
        Movie(movieName: "The Offering",
              description: "In the wake of a young Jewish girl’s disappearance, the son of a Hasidic funeral director returns home with his pregnant wife in hopes of reconciling with his father. Little do they know that directly beneath them in the family morgue, an ancient evil with sinister plans for the unborn child lurks inside a mysterious corpse.",
              artworkUrl100: URL(string: "https://www.farsinama.com/wp-content/uploads/2023/02/tbaTFgGIaTL1Uhd0SMob6Dhi5cK.jpg")!,
              backdropUrl100: URL(string:"https://www.heavenofhorror.com/wp-content/uploads/2023/01/the-offering-2022-horror-movie-review.jpg")!,
              voteAverage: "5.8 Vote Average",
              votes: "81 Votes",
              popularity: "661.8 Popularity"),
        Movie(movieName: "Puss in Boots: The Last Wish",
              description: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.",
              artworkUrl100: URL(string: "https://image.tmdb.org/t/p/w1280/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!,
              backdropUrl100: URL(string:"https://movies.universalpictures.com/media/02-pib-dm-mobile-banner-1080x745-km-f01-061422-62a9f2d372f3a-1.jpg")!,
              voteAverage: "8.5 Vote Average",
              votes: "3689 Votes",
              popularity: "2746.2 Popularity")

    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
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
