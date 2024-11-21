//
//  BaseListViewController.swift
//  TabBarDemo
//
//  Created by Чингис Богдатов on 11.11.2024.
//

import Foundation
import UIKit


// MARK - я терпеть не могу StoryBoard, поэтому сделал базовый ViewController для всех списков,
// по факту функционал будет только тут, в детях я буду менять только список который будет
// каститься к DetailsItem
// Не очень наверное красивое решение, но я так хочу
class BaseListViewController: ViewController{
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(DetailsItemTableViewCell.self, forCellReuseIdentifier: DetailsItemTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        ])
    }
    
    open func getItems() -> [DetailsItem]{
        return []
    }
}


extension BaseListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsItemTableViewCell.identifier, for: indexPath) as? DetailsItemTableViewCell else { fatalError("No default cell provided") }
        
        cell.configure(item: getItems()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewController = DetailsViewController()
        detailsViewController.item = getItems()[indexPath.row]
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
