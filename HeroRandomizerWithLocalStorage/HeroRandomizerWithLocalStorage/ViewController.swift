//
//  ViewController.swift
//  HeroRandomizerWithLocalStorage
//
//  Created by Чингис Богдатов on 28.11.2024.
//

import UIKit
import SuperHeroDataLayer
import Kingfisher

class ViewController: UIViewController {
    
    private var service: SuperHeroService?
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let statsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    private let changeHeroButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Chang eHero", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        service = SuperHeroService(delegate: self)
        service?.fechHeroes()
    }
    
    private func setupViews(){
        view.addSubview(nameLabel)
        view.addSubview(fullNameLabel)
        view.addSubview(heroImageView)
        view.addSubview(statsStackView)
        view.addSubview(changeHeroButton)
        layoutViews()
        changeHeroButton.addTarget(self, action: #selector(changeHeroButtonTapped), for: .touchUpInside)
    }
    
    private func layoutViews(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        statsStackView.translatesAutoresizingMaskIntoConstraints = false
        changeHeroButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heroImageView.widthAnchor.constraint(equalToConstant: 150),
            heroImageView.heightAnchor.constraint(equalToConstant: 150),

            nameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            statsStackView.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            changeHeroButton.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 20),
            changeHeroButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeHeroButton.widthAnchor.constraint(equalToConstant: 150),
            changeHeroButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configure(superHero: SuperHero){
        nameLabel.text = superHero.name
        fullNameLabel.text = "Full Name: \(superHero.biography.fullName)"
        
        heroImageView.kf.setImage(with: URL(string: superHero.images.sm))

        statsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        addStatRow(iconName: "brain", title: "Intelligence", value: superHero.powerstats.intelligence)
        addStatRow(iconName: "strength", title: "Strength", value: superHero.powerstats.strength)
        addStatRow(iconName: "running", title: "Speed", value: superHero.powerstats.speed)
        addStatRow(iconName: "shield", title: "Durability", value: superHero.powerstats.durability)
        addStatRow(iconName: "thunderbolt", title: "Power", value: superHero.powerstats.power)
        addStatRow(iconName: "gaming", title: "Combat", value: superHero.powerstats.combat)
    }
    
    private func addStatRow(iconName: String, title: String, value: Int) {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.spacing = 8
        rowStackView.alignment = .center

        let iconImageView = UIImageView(image: UIImage(named: iconName))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        let statLabel = UILabel()
        statLabel.text = "\(title): \(value)"
        statLabel.font = UIFont.systemFont(ofSize: 16)

        rowStackView.addArrangedSubview(iconImageView)
        rowStackView.addArrangedSubview(statLabel)

        statsStackView.addArrangedSubview(rowStackView)
    }
    
    @objc private func changeHeroButtonTapped() {
        service?.fechHeroes()
        UIView.animate(withDuration: 0.3, animations: {
            self.heroImageView.alpha = 0
            self.nameLabel.alpha = 0
            self.fullNameLabel.alpha = 0
            self.statsStackView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.heroImageView.alpha = 1
                self.nameLabel.alpha = 1
                self.fullNameLabel.alpha = 1
                self.statsStackView.alpha = 1
            }
        }
    }
}


extension ViewController: SuperHeroServiceDelegate{
    
    func onRequestComplete(hero: SuperHero) {
        configure(superHero: hero)
    }
    
    func onRequestError(errorMessage: String?) {
        let alertController = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
