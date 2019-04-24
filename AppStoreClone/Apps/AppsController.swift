//
//  AppsController.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/24/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

class AppsController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
    }
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
