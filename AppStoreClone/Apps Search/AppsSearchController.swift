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
    
    // 1 - populate cells with itunes api data
    // 2 - extract function fetchItunesApps() outside of controller file
    
    fileprivate func fetchItunesApps() {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {
            return
        }
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("fail to fetch apps \(err)")
                return
            }
            
            // SUCCESS
            guard let data = data else {
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                self.appResults = searchResult.results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let jsonError {
                print("fail to decode json", jsonError)
            }
            
        }.resume() // fires off the request
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? SearchResultCell else {
            return UICollectionViewCell()
        }
        
        let appResult = appResults[indexPath.row]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        
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
