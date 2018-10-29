//
//  ChatRoomsController.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/29/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ChatRoomsController: UITableViewController {
    
    let chatRoomGroups = [
    ["generals", "introductions"],
    ["jobs"],
    ["Viswajith", "Steve Jobs", "Tim Cook", "Barak Obama"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2274509804, blue: 0.2941176471, alpha: 1)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
//    }
    
    fileprivate class ChatRoomsHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)))
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = ChatRoomsHeaderLabel()
        label.text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        label.textColor = .gray
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomGroups[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatRoomGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ChatRoomsMenuCell(style: .default, reuseIdentifier: "cellId")
        let text = chatRoomGroups[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.attributedText = attributedText(text: text)
        return cell
    }
    
    func attributedText(text: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)])
        attributedText.append(NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]))
        return attributedText
    }
    
}
