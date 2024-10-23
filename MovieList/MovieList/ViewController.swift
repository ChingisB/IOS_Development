//
//  ViewController.swift
//  MovieList
//
//  Created by Чингис Богдатов on 22.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.dataSource = self
        addMovies()
    }
    
    private func addMovies(){
        let matrix = Movie(
            image: UIImage(imageLiteralResourceName: "matrix"),
            name: "Matrix",
            description: "Alternate future with people serving as batteries."
        )
        
        let whiplash = Movie(
            image: UIImage(imageLiteralResourceName: "whiplash"),
            name: "Whiplash",
            description: "Movie about passion, talent and effot in music"
        )
        let theDeparted = Movie(
            image: UIImage(imageLiteralResourceName: "the_departed"),
            name: "The departed",
            description: "Moview about criminal side of New York, and police operation against organized crime"
        )
        let steinsGate = Movie(
            image: UIImage(imageLiteralResourceName: "steins_gate"),
            name: "Steins Gate",
            description: "Anime about time travel and all related stereotypes and myths, like John Titor."
        )
        let seven = Movie(
            image: UIImage(imageLiteralResourceName: "seven"),
            name: "Se7en",
            description: "Bradd Pitt and Morgan Freeman are hunting down violent serial killer"
        )
        let pulpFiction = Movie(
            image: UIImage(imageLiteralResourceName: "pulp_fiction"),
            name: "Pulp Fiction",
            description: "Classic, doesn't really have any plot, just funny movie to chill"
        )
        let hollywood = Movie(
            image: UIImage(imageLiteralResourceName: "once_upon_a_time_in_hollywood"),
            name: "Once upon a time in Hollywood",
            description: "Golden age of Hollywood shown from perspective of 2 friends"
        )
        let killBill = Movie(
            image: UIImage(imageLiteralResourceName: "kill_bill"),
            name: "Kill Bill",
            description: "Director's most favourite actress uses katana to get a divorce"
        )
        let basterds  = Movie(
            image: UIImage(imageLiteralResourceName: "inglourious_basterds"),
            name: "Inglourious basterds",
            description: "Alternate ending for WW2. Villain is better than main characters"
        )
        let future = Movie(
            image: UIImage(imageLiteralResourceName: "back_to_the_future"),
            name: "Back to the Future",
            description: "A pefect comedy about time travel"
        )
        movieList.append(matrix)
        movieList.append(whiplash)
        movieList.append(theDeparted)
        movieList.append(steinsGate)
        movieList.append(seven)
        movieList.append(pulpFiction)
        movieList.append(hollywood)
        movieList.append(killBill)
        movieList.append(basterds)
        movieList.append(future)
    }

}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! MoviewViewCell
        cell.configure(movieList[indexPath.row])
        return cell
    }
}

