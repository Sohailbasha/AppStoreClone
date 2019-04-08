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
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Today"
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.navigationBar.prefersLargeTitles = true
        redNavController.tabBarItem.title = "Today"
        redNavController.tabBarItem.image = UIImage(named: "today_icon")

        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Apps"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.title = "Apps"
        blueNavController.tabBarItem.image = UIImage(named: "apps")

        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .white
        yellowViewController.navigationItem.title = "Search"
        let yellowNavController = UINavigationController(rootViewController: yellowViewController)
        yellowNavController.navigationBar.prefersLargeTitles = true
        yellowNavController.tabBarItem.title = "Search"
        yellowNavController.tabBarItem.image = UIImage(named: "search")

        viewControllers = [
            redNavController,
            blueNavController,
            yellowNavController
        ]
    }
}
