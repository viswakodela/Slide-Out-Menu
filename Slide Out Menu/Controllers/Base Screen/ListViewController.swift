//
//  ListViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/23/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(lable)
        lable.frame = view.frame
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Lists" 
    }
    
    let lable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        label.text = "Lists"
        label.textAlignment = .center
        return label
    }()
}
