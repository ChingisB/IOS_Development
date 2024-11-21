//
//  ViewController.swift
//  SuperHeroApp
//
//  Created by Чингис Богдатов on 21.11.2024.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let fullNameLabel = UILabel()
    private let heroImageView = UIImageView()
    private let statsStackView = UIStackView()
    private let changeHeroButton = UIButton(type: .system)
    
    
    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    private var heroes: [SuperHero] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        loadAsyncTask()
    }
    
    private func setupViews(){
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)

        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        fullNameLabel.textAlignment = .center
        fullNameLabel.textColor = .darkGray
        view.addSubview(fullNameLabel)

        heroImageView.contentMode = .scaleAspectFit
        heroImageView.clipsToBounds = true
        view.addSubview(heroImageView)

        statsStackView.axis = .vertical
        statsStackView.spacing = 10
        statsStackView.alignment = .leading
        view.addSubview(statsStackView)

        changeHeroButton.setTitle("Change Hero", for: .normal)
        changeHeroButton.setTitleColor(.white, for: .normal)
        changeHeroButton.backgroundColor = .systemBlue
        changeHeroButton.layer.cornerRadius = 10
        changeHeroButton.addTarget(self, action: #selector(changeHeroButtonTapped), for: .touchUpInside)
        view.addSubview(changeHeroButton)
    }
    
    private func layoutViews() {
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
    
    private func configureWithSuperHero(superhero: SuperHero) {
        
        nameLabel.text = superhero.name
        fullNameLabel.text = "Full Name: \(superhero.biography.fullName)"
            
        if let imageUrl = URL(string: superhero.images.sm) {
            loadImage(from: imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.heroImageView.image = image
                }
            }
        }

        statsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        addStatRow(iconName: "brain", title: "Intelligence", value: superhero.powerstats.intelligence)
        addStatRow(iconName: "strength", title: "Strength", value: superhero.powerstats.strength)
        addStatRow(iconName: "running", title: "Speed", value: superhero.powerstats.speed)
        addStatRow(iconName: "shield", title: "Durability", value: superhero.powerstats.durability)
        addStatRow(iconName: "thunderbolt", title: "Power", value: superhero.powerstats.power)
        addStatRow(iconName: "gaming", title: "Combat", value: superhero.powerstats.combat)
    }

    private func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }

    @objc private func changeHeroButtonTapped() {
        loadAsyncTask()
        UIView.animate(withDuration: 0.3, animations: {
            self.heroImageView.alpha = 0
            self.nameLabel.alpha = 0
            self.fullNameLabel.alpha = 0
            self.statsStackView.alpha = 0
        }) { _ in
            let randomHero = self.heroes.randomElement()!
            self.configureWithSuperHero(superhero: randomHero)
      
            UIView.animate(withDuration: 0.3) {
                self.heroImageView.alpha = 1
                self.nameLabel.alpha = 1
                self.fullNameLabel.alpha = 1
                self.statsStackView.alpha = 1
            }
        }
    }
    
    private func fetchHeroAsync() async {
        let result = await AF.request(api).serializingDecodable([SuperHero].self).result
        switch result {
        case .success(let heroes):
            self.heroes = heroes
        case .failure(let error):
            showErrorDialog(title: "Error!", message: "Something went wrong while fetching data")
        }
    }
    
    private func loadAsyncTask(){
        Task {
            await fetchHeroAsync()
            let randomHero = heroes.randomElement()!
            configureWithSuperHero(superhero: randomHero)
        }
    }
    
    private func showErrorDialog(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

