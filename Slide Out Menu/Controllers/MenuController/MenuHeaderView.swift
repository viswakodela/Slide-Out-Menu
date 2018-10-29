//
//  MenuHeaderView.swift
//  Slide Out Menu
//
//  Created by Viswa Kodela on 10/22/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    let profileImageView: ProfileImageView = {
        let iv = ProfileImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "girl_profile")
        iv.layer.cornerRadius = 24
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.text = "Viswajith Kodela"
        return label
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@viswaKodela"
        label.textColor = .gray
        return label
    }()
    
    let statsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "42 Following   700 Followers"
        return label
    }()
    
    func attributedText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "42", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .heavy)])
        attributedText.append(NSAttributedString(string: " Following", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "   700", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .heavy)]))
        attributedText.append(NSAttributedString(string: " Followers", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        return attributedText
    }
    
    fileprivate func setupViews() {
        
        let views = [UIStackView(arrangedSubviews: [profileImageView, UIView()]), nameLabel, userName, UIView(), UIView(), statsLabel]
        
        statsLabel.attributedText = self.attributedText()
        
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        self.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
