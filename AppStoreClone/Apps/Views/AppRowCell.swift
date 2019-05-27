//
//  AppRowCell.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 5/26/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        let verticalStackView = VerticalStackView(arrangedSubViews: [nameLabel, companyLabel], spacing: 4)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, verticalStackView, getButton])
        addSubview(stackView)
        stackView.fillSuperview()
        
        imageView.backgroundColor = .yellow
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        stackView.spacing = 16
        stackView.alignment = .center
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 32/2
        
        nameLabel.backgroundColor = .red
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
