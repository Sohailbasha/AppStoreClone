//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/8/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .red
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        
        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        
        viewControllers = [
            redViewController,
            blueViewController,
            yellowViewController
        ]
    }
}
