//
//  ViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/17/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }
    
    fileprivate func setupNavigationItems() {
        tableView.backgroundColor = .red
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    let menuController = MenuController()
    @objc func openButtonTapped() {
        
        menuController.view.frame = CGRect(x: -300, y: 0, width: 300, height: self.view.frame.height)
        guard let keyWindow = UIApplication.shared.keyWindow else {return}
        keyWindow.addSubview(menuController.view)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//          both will work
//          self.menuController.view.frame = CGRect(x: 0, y: 0, width: 300, height: self.view.frame.height)
            self.menuController.view.transform = CGAffineTransform(translationX: 300, y: 0)
        }, completion: nil)
        addChild(menuController)
    }
    
    @objc func handleHide() {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.menuController.view.transform = .identity
        }, completion: nil)
//        menuController.view.removeFromSuperview()
//        menuController.removeFromParent()
    }
    
}

//MARK:- TableView Methods
extension HomeController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
}

