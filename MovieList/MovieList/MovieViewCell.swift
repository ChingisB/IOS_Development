//
//  MovieViewCell.swift
//  MovieList
//
//  Created by Чингис Богдатов on 23.10.2024.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    public static let identifier = "movieCell"
    
    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameTextView: UILabel = {
        return UILabel()
    }()
    
    private let descriptionTextView: UILabel = {
        return UILabel()
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.addSubview(coverImageView)
        contentView.addSubview(nameTextView)
        contentView.addSubview(descriptionTextView)
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            coverImageView.widthAnchor.constraint(equalToConstant: 100),
            coverImageView.heightAnchor.constraint(equalToConstant: 100),
            nameTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameTextView.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 8.0),
            descriptionTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 8.0),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: nameTextView.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor, constant: 8.0)
            
        ])
    }
    
    public func configure(movie: Movie){
        coverImageView.image = movie.cover
        nameTextView.text = movie.name
        descriptionTextView.text = movie.description
    }
    
}
