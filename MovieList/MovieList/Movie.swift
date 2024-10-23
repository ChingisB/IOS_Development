//
//  Movie.swift
//  MovieList
//
//  Created by Чингис Богдатов on 23.10.2024.
//

import Foundation
import UIKit


struct Movie{
    let name: String;
    let description: String;
    let cover: UIImage
}


func getMovies() ->[Movie]{
    let backToTheFuture = Movie(
        name: "Back to the future",
        description: "Coolest movie about time travel. \nBrilliant humor, and music. \nStarring Christopher Loyd and Michael J. Fox", 
        cover: UIImage(imageLiteralResourceName: "back_to_the_future")
    )
    
    let basterds = Movie(
        name: "Inglourious basterds",
        description: "Huge what if about WW2",
        cover: UIImage(imageLiteralResourceName: "inglourious_basterds")
    )
    
    let killBill = Movie(
        name: "Kill Bill",
        description: "Woman gets a divorce with katana",
        cover: UIImage(imageLiteralResourceName: "kill_bill")
    )
    
    let matrix = Movie(
        name: "Matrix",
        description: "Human serve as batteries but the chosen one stops it",
        cover: UIImage(imageLiteralResourceName: "matrix")
    )
    
    let hollywood = Movie(
        name: "Once upon a time in Hollywood",
        description: "Actor and his stunt enjoy Hollywodd",
        cover: UIImage(imageLiteralResourceName: "once_upon_a_time_in_hollywood")
    )
    
    let pulpFiction = Movie(
        name: "Pulp Fiction",
        description: "Movie without script, just humor",
        cover: UIImage(imageLiteralResourceName: "pulp_fiction")
    )
    
    let seven = Movie(
        name: "Se7en",
        description: "Bradd Pitt and Morgan Freeman hunt down a serial killer",
        cover: UIImage(imageLiteralResourceName: "seven")
    )
    
    let steinsGate = Movie(
        name: "Steins gate",
        description: "Anime about time travel and stereotypes like John Titor",
        cover: UIImage(imageLiteralResourceName: "steins_gate")
    )
    
    let departed = Movie(
        name: "The Departed",
        description: "NYPD special operation against organised crime",
        cover: UIImage(imageLiteralResourceName: "the_departed")
    )
    
    let whiplash = Movie(
        name: "Whiplash",
        description: "Movie about J.K Simmons abusing musicians",
        cover: UIImage(imageLiteralResourceName: "whiplash")
    )
    
    return [
        backToTheFuture,
        basterds,
        killBill,
        matrix,
        hollywood,
        pulpFiction,
        seven,
        steinsGate,
        departed,
        whiplash
    ]
}
