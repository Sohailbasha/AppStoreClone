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
        
        let TodayViewController = UIViewController()
        TodayViewController.view.backgroundColor = .white
        TodayViewController.navigationItem.title = "Today"
        let todayNavController = UINavigationController(rootViewController: TodayViewController)
        todayNavController.navigationBar.prefersLargeTitles = true
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = UIImage(named: "today_icon")

        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        let appsNavController = UINavigationController(rootViewController: appsViewController)
        appsNavController.navigationBar.prefersLargeTitles = true
        appsNavController.tabBarItem.title = "Apps"
        appsNavController.tabBarItem.image = UIImage(named: "apps")

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")

        viewControllers = [
            todayNavController,
            appsNavController,
            searchNavController
        ]
    }
}
