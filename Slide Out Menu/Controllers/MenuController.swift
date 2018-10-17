//
//  TableViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/17/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

//MARK:- TableView Methods
extension MenuController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Row: \(indexPath.row)"
        return cell
    }
    
}
