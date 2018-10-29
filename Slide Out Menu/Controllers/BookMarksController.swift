//
//  BookMarksControllerTableViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/27/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class BookMarksController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }

}
