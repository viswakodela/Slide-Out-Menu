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
    let menuController = MenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        
        menuController.view.frame = CGRect(x: -300, y: 0, width: 300, height: self.view.frame.height)
        guard let keyWindow = UIApplication.shared.keyWindow else {return}
        keyWindow.addSubview(menuController.view)
        addChild(menuController)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    fileprivate var isMenuOpened = false
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        if gesture.state == .changed {
            var x = translation.x
            print(x)
            
            if isMenuOpened {
                x = x + 300
            }
            
            x = min(300, x)
            x = max(0, x)
            menuController.view.transform = CGAffineTransform(translationX: x, y: 0)
            navigationController?.view.transform = CGAffineTransform(translationX: x, y: 0)
            
        } else if gesture.state == .ended {
            
            if isMenuOpened {
                // abs() method will turn any value in negavie into positive.
                if abs(translation.x) < 40 {
                    openButtonTapped()
                } else {
                    handleHide()
                }
            } else {
                if translation.x < 40 {
                    handleHide()
                } else {
                    openButtonTapped()
                }
            }
        }
    }
    
    fileprivate func setupNavigationItems() {
        tableView.backgroundColor = .red
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(handleHide))
    }
    
    fileprivate func performTransform(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.menuController.view.transform = transform
//            self.view.transform = transform
            self.navigationController?.view.transform = transform
        }, completion: nil)
    }
    
    @objc func openButtonTapped() {
        isMenuOpened = true
        performTransform(transform: CGAffineTransform(translationX: 300, y: 0))
    }
    
    @objc func handleHide() {
        isMenuOpened = false
        performTransform(transform: .identity)
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

