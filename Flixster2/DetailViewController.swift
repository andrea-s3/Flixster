//
//  DetailViewController.swift
//
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieDesLabel: UILabel!
    
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    var poster: Poster!
    
    var movie: Movie!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = movie.backdrop_path
        let urlString = url.absoluteString
        
        let finalUrl = "https://image.tmdb.org/t/p/original//" + urlString
        let finalFinalUrl = URL(string: finalUrl)
        
        let movie_average = String(movie.vote_average)
        let movie_votes = String(movie.vote_count)
        let movie_popularity = String(movie.popularity)
        
        Nuke.loadImage(with: finalFinalUrl!, into: movieImageView)
        movieNameLabel.text = movie.original_title
        movieDesLabel.text = movie.overview
        averageLabel.text = movie_average + " Vote Average"
        votesLabel.text = movie_votes + " Votes"
        popularityLabel.text = movie_votes + " Popularity"
//

//                self.title = movie.original_title
        
        // Create a date formatter to style our date and convert it to a string
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
//        releaseDateLabel.text = dateFormatter.string(from: track.releaseDate)

        // Use helper method to convert milliseconds into `mm:ss` string format
//        durationLabel.text = formattedTrackDuration(with: track.trackTimeMillis)

    }


}
