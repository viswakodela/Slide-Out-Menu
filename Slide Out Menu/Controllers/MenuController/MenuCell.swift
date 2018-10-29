//
//  MenuCellTableViewCell.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/22/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCells()
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "moments")
        return iv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate func setupCells() {
        
        addSubview(iconImageView)
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(title)
        title.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10).isActive = true
        title.topAnchor.constraint(equalTo: iconImageView.topAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8).isActive = true
        title.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
