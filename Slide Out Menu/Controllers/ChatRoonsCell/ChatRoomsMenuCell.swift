//
//  ChatRoomsMenuCell.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/29/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ChatRoomsMenuCell: UITableViewCell {
    
    let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2078431373, green: 0.431372549, blue: 0.4862745098, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        bgView.isHidden = selected ? false : true
        
//        contentView.backgroundColor = selected ? .orange : .clear
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(bgView)
        bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        sendSubviewToBack(bgView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
