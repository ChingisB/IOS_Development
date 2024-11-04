//
//  Movie.swift
//  MovieListWithNavigation
//
//  Created by Чингис Богдатов on 04.11.2024.
//

import Foundation
import UIKit


struct Movie{
    let name: String;
    let description: String;
    let cover: UIImage;
    let releaseDate: String
}


func getMovies() ->[Movie]{
    let backToTheFuture = Movie(
        name: "Back to the future",
        description: "Coolest movie about time travel. \nBrilliant humor, and music. \nStarring Christopher Loyd and Michael J. Fox",
        cover: UIImage(imageLiteralResourceName: "back_to_the_future"),
        releaseDate: "25.05.1985"
    )
    
    let basterds = Movie(
        name: "Inglourious basterds",
        description: "Huge what if about WW2",
        cover: UIImage(imageLiteralResourceName: "inglourious_basterds"),
        releaseDate: "07.07.2010"
    )
    
    let killBill = Movie(
        name: "Kill Bill",
        description: "Woman gets a divorce with katana",
        cover: UIImage(imageLiteralResourceName: "kill_bill"),
        releaseDate: "09.10.2008"
    )
    
    let matrix = Movie(
        name: "Matrix",
        description: "Human serve as batteries but the chosen one stops it",
        cover: UIImage(imageLiteralResourceName: "matrix"),
        releaseDate: "16.05.1997"
    )
    
    let hollywood = Movie(
        name: "Once upon a time in Hollywood",
        description: "Actor and his stunt enjoy Hollywodd",
        cover: UIImage(imageLiteralResourceName: "once_upon_a_time_in_hollywood"),
        releaseDate: "18.06.2018"
    )
    
    let pulpFiction = Movie(
        name: "Pulp Fiction",
        description: "Movie without script, just humor",
        cover: UIImage(imageLiteralResourceName: "pulp_fiction"),
        releaseDate: "08.12.1998"
    )
    
    let seven = Movie(
        name: "Se7en",
        description: "Bradd Pitt and Morgan Freeman hunt down a serial killer",
        cover: UIImage(imageLiteralResourceName: "seven"),
        releaseDate: "05.11.2003"
    )
    
    let steinsGate = Movie(
        name: "Steins gate",
        description: "Anime about time travel and stereotypes like John Titor",
        cover: UIImage(imageLiteralResourceName: "steins_gate"),
        releaseDate: "11.11.2011"
    )
    
    let departed = Movie(
        name: "The Departed",
        description: "NYPD special operation against organised crime",
        cover: UIImage(imageLiteralResourceName: "the_departed"),
        releaseDate: "13.12.2009"
    )
    
    let whiplash = Movie(
        name: "Whiplash",
        description: "Movie about J.K Simmons abusing musicians",
        cover: UIImage(imageLiteralResourceName: "whiplash"),
        releaseDate: "12.11.2013"
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
