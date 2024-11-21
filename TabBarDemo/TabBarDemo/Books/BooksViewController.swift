//
//  BooksViewController.swift
//  TabBarDemo
//
//  Created by Чингис Богдатов on 11.11.2024.
//

import Foundation

class BooksViewController: BaseListViewController{
    
    override func getItems() -> [any DetailsItem] {
        return getBooks()
    }
}
