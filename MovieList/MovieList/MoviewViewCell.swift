//
//  MoviewViewCell.swift
//  MovieList
//
//  Created by Чингис Богдатов on 22.10.2024.
//

import UIKit

class MoviewViewCell: UITableViewCell {

    
    @IBOutlet weak var moviewDescriptionTextView: UILabel!
    @IBOutlet weak var movieNameTextView: UILabel!
    @IBOutlet weak var moviewCoverImageView: UIImageView!

    
    func configure(_ movie: Movie){
        movieDescription.text = movie.description
        movieNameTextView.text = movie.name
        moviewCoverImageView.image = movie.image
    }

}
