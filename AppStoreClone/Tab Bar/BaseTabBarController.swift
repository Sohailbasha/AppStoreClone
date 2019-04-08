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
        redViewController.tabBarItem.title = "red"
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "RED"

        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        blueViewController.tabBarItem.title = "blue"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "BLUE"

        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        yellowViewController.tabBarItem.title = "yellow"
        let yellowNavController = UINavigationController(rootViewController: yellowViewController)
        yellowNavController.tabBarItem.title = "YELLOW"
        
        viewControllers = [
            redNavController,
            blueNavController,
            yellowNavController
        ]
    }
}
