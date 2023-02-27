//
//
//  Created by Andrea Sanchez on 2/23/23.
//

import Nuke
import UIKit

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // the number of items shown should be the number of albums we have.
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        // Use the indexPath.item to index into the albums array to get the corresponding album
        let poster = movies[indexPath.item]

        let imageUrl = poster.poster_path
        let urlString = imageUrl.absoluteString
        
        let finalUrl = "https://image.tmdb.org/t/p/original//" + urlString
        let finalFinalUrl = URL(string: finalUrl)
        
        // Set the image on the image view of the cell
        Nuke.loadImage(with: finalFinalUrl!, into: cell.posterImageView)
        return cell
    }
    
    var movies: [Movie] = []
    var posters: [Poster] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=40e0b934b56098f1e8692b86d496e611")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            // Create a JSON Decoder
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let albums = response.results
                
                DispatchQueue.main.async {
                    self?.movies = albums
                    self?.collectionView.reloadData()
                }
                print (albums)
            }
            catch {
                print(error.localizedDescription)
            }

        }
            
            // Initiate the network request
            task.resume()

            
//
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

            // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumInteritemSpacing = 4

            // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumLineSpacing = 4

            // Set this to however many columns you want to show in the collection.
            let numberOfColumns: CGFloat = 3

            // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
            let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

            // Set the size that each tem/cell should display at
            layout.itemSize = CGSize(width: width, height: width)

        }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Posters"
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
        }
    }
    
}

