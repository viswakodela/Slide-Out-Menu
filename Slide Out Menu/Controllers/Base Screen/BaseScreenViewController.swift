//
//  BaseScreenViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/20/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class BaseScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    var redViewLeadingAnchor: NSLayoutConstraint!
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        var x = translation.x
        
        x = isMenuOpened ? x + menuWidth : x
        x = min(menuWidth, x)
        x = max(0, x) // this piece of code is for the negative direction
        
        self.redViewLeadingAnchor.constant = x
        darkCoverView.alpha = x / menuWidth
        
        if gesture.state == .ended {
            gestureEnded(gesture: gesture)
        }
    }
    
    let darkCoverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        return view
    }()
    
    fileprivate func gestureEnded(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        if translation.x < 50 {
            closeMenu()
        } else {
            openMenu()
        }
    }
    
    func openMenu() {
        redViewLeadingAnchor.constant = menuWidth
        isMenuOpened = true
        performAnimation()
    }
    
    func closeMenu() {
        redViewLeadingAnchor.constant = 0
        isMenuOpened = false
        performAnimation()
    }
    
    func performAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.darkCoverView.alpha = self.isMenuOpened ? 1 : 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let menuWidth: CGFloat = 300
    var isMenuOpened = false
    
    func setupViews() {
        self.view.addSubview(redView)
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.redViewLeadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        redViewLeadingAnchor.isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(blueView)
        blueView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: redView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: menuWidth).isActive = true
        blueView.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        
        setupViewControllers()
    }
    let homeControlelr = HomeController()
    let menuController = MenuController()
    func setupViewControllers() {
        
        
        guard let homeView = homeControlelr.view else {return}
        guard let menuView = menuController.view else {return}
        homeView.translatesAutoresizingMaskIntoConstraints = false
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.addSubview(homeView)
        homeView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
        homeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
        homeView.trailingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        
        redView.addSubview(darkCoverView)
        darkCoverView.topAnchor.constraint(equalTo: redView.topAnchor).isActive = true
        darkCoverView.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
        darkCoverView.trailingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        darkCoverView.bottomAnchor.constraint(equalTo: redView.bottomAnchor).isActive = true
        
        blueView.addSubview(menuView)
        menuView.topAnchor.constraint(equalTo: blueView.topAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor).isActive = true
        
        addChild(homeControlelr)
        addChild(menuController)
        
    }
    
}
