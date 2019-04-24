//
//  AppsHorizontalController.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/24/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

class AppsHorizontalController: BaseListController {
    
    fileprivate let cellID = "appsGroupCell"
    
    let topBottomPadding: CGFloat = 12
    let leftRightPadding: CGFloat = 16
    let lineSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemHeight = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing)/3
        // subtract top and bottom edges from height. And default line spacing. divide by max number of items
        return .init(width: view.frame.width, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
    }
}
