//
//  BookItem.swift
//  TabBarDemo
//
//  Created by Чингис Богдатов on 22.11.2024.
//

import Foundation
import UIKit


struct BookItem: DetailsItem{
    let cover: UIImage
    let name: String
    let description: String
    let releaseDate: String
}


func getBooks() ->[BookItem]{
    let backToTheFuture = BookItem(
        cover: UIImage(imageLiteralResourceName: "back_to_the_future"),
        name: "Back to the future",
        description: "Coolest movie about time travel. \nBrilliant humor, and music. \nStarring Christopher Loyd and Michael J. Fox",
        releaseDate: "25.05.1985"
    )
    
    let basterds = BookItem(
        cover: UIImage(imageLiteralResourceName: "inglourious_basterds"),
        name: "Inglourious basterds",
        description: "Huge what if about WW2",
        releaseDate: "07.07.2010"
    )
    
    let killBill = BookItem(
        cover: UIImage(imageLiteralResourceName: "kill_bill"),
        name: "Kill Bill",
        description: "Woman gets a divorce with katana",
        releaseDate: "09.10.2008"
    )
    
    let matrix = BookItem(
        cover: UIImage(imageLiteralResourceName: "matrix"),
        name: "Matrix",
        description: "Human serve as batteries but the chosen one stops it",
        releaseDate: "16.05.1997"
    )
    
    let hollywood = BookItem(
        cover: UIImage(imageLiteralResourceName: "once_upon_a_time_in_hollywood"),
        name: "Once upon a time in Hollywood",
        description: "Actor and his stunt enjoy Hollywodd",
        releaseDate: "18.06.2018"
    )
    
    let pulpFiction = BookItem(
        cover: UIImage(imageLiteralResourceName: "pulp_fiction"),
        name: "Pulp Fiction",
        description: "Movie without script, just humor",
        releaseDate: "08.12.1998"
    )
    
    let seven = BookItem(
        cover: UIImage(imageLiteralResourceName: "seven"),
        name: "Se7en",
        description: "Bradd Pitt and Morgan Freeman hunt down a serial killer",
        releaseDate: "05.11.2003"
    )
    
    let steinsGate = BookItem(
        cover: UIImage(imageLiteralResourceName: "steins_gate"),
        name: "Steins gate",
        description: "Anime about time travel and stereotypes like John Titor",
        releaseDate: "11.11.2011"
    )
    
    let departed = BookItem(
        cover: UIImage(imageLiteralResourceName: "the_departed"),
        name: "The Departed",
        description: "NYPD special operation against organised crime",
        releaseDate: "13.12.2009"
    )
    
    let whiplash = BookItem(
        cover: UIImage(imageLiteralResourceName: "whiplash"),
        name: "Whiplash",
        description: "Movie about J.K Simmons abusing musicians",
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

