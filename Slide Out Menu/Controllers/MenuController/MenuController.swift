//
//  TableViewController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/17/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}

class MenuController: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MenuCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
    let menuItems = [
        MenuItem(icon: #imageLiteral(resourceName: "profile"), title: "Home"),
        MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "Lists"),
        MenuItem(icon: UIImage(named: "bookmarks")!, title: "Bookmarks"),
        MenuItem(icon: #imageLiteral(resourceName: "moments"), title: "Moments")
    ]
}

//MARK:- TableView Methods
extension MenuController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuCell
        let menuItem = menuItems[indexPath.row]
        cell.iconImageView.image = menuItem.icon
        cell.title.text = menuItem.title
        cell.title.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MenuHeaderView()
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseController = UIApplication.shared.keyWindow?.rootViewController as! BaseScreenViewController
        baseController.didSelectMenuItems(indexPath: indexPath)
    }
}
