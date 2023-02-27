//
//  MovieCell.swift
//
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDesLabel: UILabel!
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        movieNameLabel.text = movie.original_title
        movieDesLabel.text = movie.overview
        
        
        let url = movie.poster_path
        let urlString = url.absoluteString
        
        let finalUrl = "https://image.tmdb.org/t/p/original//" + urlString
        
        let finalFinalUrl = URL(string: finalUrl)
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: finalFinalUrl!, into: movieImageView)
    }

}
