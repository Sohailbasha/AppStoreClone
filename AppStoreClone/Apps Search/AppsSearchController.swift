//
//  AppsSearchController.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/8/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {

    fileprivate var cellId = "searchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        fetchItunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func fetchItunesApps() {
        APIService.sharedInstance.fetchApps { (results, error) in
            
            if let error = error {
                print("fail to fetch apps", error)
                return
            }
            
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SearchResultCell else {
            return UICollectionViewCell()
        }
        
        let appResult = appResults[indexPath.item] // recomended by apple
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        if let rating = appResult.averageUserRating {
            cell.ratingsLabel.text = "\(rating)"
        } else {
            cell.ratingsLabel.text = " "
        }
        
        let url = URL(string: appResult.artworkUrl100)
        cell.appIconImageView.sd_setImage(with: url, completed: nil)
        
        cell.screenshot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]), completed: nil)

        if appResult.screenshotUrls.count > 1 {
            cell.screenshot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]), completed: nil)
        }
        
        if appResult.screenshotUrls.count > 2 {
            cell.screenshot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]), completed: nil)
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
}
