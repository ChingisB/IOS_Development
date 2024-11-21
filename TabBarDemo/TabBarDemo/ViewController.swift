//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Чингис Богдатов on 11.11.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
        // I'm doing this assignment late, but the idea was that it's pretty easy to add new viewController
    private func setupTabBar() {
        let firstViewController = BooksViewController()
        let secondViewController = BooksViewController()
        let thirdViewController = BooksViewController()
            
        firstViewController.title = "Movies"
        firstViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
            
        secondViewController.title = "Books"
        secondViewController.tabBarItem = UITabBarItem(title: "Book", image: UIImage(systemName: "heart.fill"), tag: 1)
            
        thirdViewController.title = "Music"
        thirdViewController.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "list.bullet.rectangle"), tag: 2)
            
        viewControllers = [UINavigationController(rootViewController: firstViewController),
                               UINavigationController(rootViewController: secondViewController),
                               UINavigationController(rootViewController: thirdViewController)]
        }
}
