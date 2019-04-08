//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/8/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "app name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos and video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.2M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.backgroundColor = .white
    
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsStackView.axis = .vertical
        
        let horizontalStackView = UIStackView(arrangedSubviews: [imageView,
                                                       labelsStackView,
                                                       getButton])
        horizontalStackView.alignment = .center
        // subviews perpendicular to stackview will be centered.
        // imageview will need a heightanchor so that it won't be squished (since height is not defined)
        
        horizontalStackView.spacing = 12
        
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        backgroundColor = .yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
