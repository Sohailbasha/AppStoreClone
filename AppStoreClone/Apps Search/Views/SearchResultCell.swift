//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/8/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit
import SDWebImage

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result? {
        didSet {
            if let appResult = appResult {
                self.nameLabel.text = appResult.trackName
                self.categoryLabel.text = appResult.primaryGenreName
                
                if let rating = appResult.averageUserRating {
                    self.ratingsLabel.text = "\(rating)"
                } else {
                    self.ratingsLabel.text = " "
                }
                
                self.appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100), completed: nil)
                self.screenshot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]), completed: nil)
                
                if appResult.screenshotUrls.count > 1 {
                    self.screenshot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]), completed: nil)
                }
                
                if appResult.screenshotUrls.count > 2 {
                    self.screenshot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]), completed: nil)
                }

            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
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
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        button.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        return button
    }()
    
    lazy var screenshot1 = self.createScreenshotImageView()
    lazy var screenshot2 = self.createScreenshotImageView()
    lazy var screenshot3 = self.createScreenshotImageView()

    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelsStackView = VerticalStackView(arrangedSubViews: [
            nameLabel, categoryLabel, ratingsLabel
            ])
        
        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelsStackView, getButton
            ])
        
        infoTopStackView.alignment = .center
        infoTopStackView.spacing = 12
        
        let screenshotStackview = UIStackView(arrangedSubviews: [
            screenshot1, screenshot2, screenshot3
            ])
        
        screenshotStackview.spacing = 12
        screenshotStackview.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubViews: [
            infoTopStackView, screenshotStackview
            ], spacing: 16)

        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
