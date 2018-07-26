//
//  MovieDetailViewController.swift
//  MovieSearch-C
//
//  Created by Zachary Frew on 7/26/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Properties
    var movie: ZMFMovie?

    // MARK: - Methods
    func updateViews() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        overviewLabel.text = movie.overview
        ZMFMovieController.shared().retrieveImage(for: movie) { (image) in
            DispatchQueue.main.async {
                self.movieImageView.image = image
            }
        }
    }
    
}
