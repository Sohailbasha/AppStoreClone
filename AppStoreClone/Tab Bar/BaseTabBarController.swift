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
        redViewController.navigationItem.title = "Today"
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.navigationBar.prefersLargeTitles = true
        redNavController.tabBarItem.title = "RED"
        redNavController.tabBarItem.image = UIImage(named: "today_icon")

        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .blue
        blueViewController.navigationItem.title = "Apps"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.title = "BLUE"
        blueNavController.tabBarItem.image = UIImage(named: "apps")


        let yellowViewController = UIViewController()
        yellowViewController.view.backgroundColor = .yellow
        yellowViewController.navigationItem.title = "Search"
        let yellowNavController = UINavigationController(rootViewController: yellowViewController)
        yellowNavController.navigationBar.prefersLargeTitles = true
        yellowNavController.tabBarItem.title = "YELLOW"
        yellowNavController.tabBarItem.image = UIImage(named: "search")

        
        viewControllers = [
            redNavController,
            blueNavController,
            yellowNavController
        ]
    }
}
