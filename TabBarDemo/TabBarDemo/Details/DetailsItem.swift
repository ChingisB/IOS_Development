//
//  DetailsItem.swift
//  TabBarDemo
//
//  Created by Чингис Богдатов on 11.11.2024.
//

import Foundation
import UIKit


protocol DetailsItem{
    var cover: UIImage { get }
    var name: String { get }
    var description: String { get }
    var releaseDate: String { get }
}
