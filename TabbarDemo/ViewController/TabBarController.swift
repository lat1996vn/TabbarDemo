//
//  TabBarController.swift
//  TabbarDemo
//
//  Created by TuanLA on 7/9/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let feedViewController = FeedVC()
        feedViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let followViewController = FollowVC()
        followViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let searchViewController = SearchVC()
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        let favoriteViewControllers = FavoriteVC()
        favoriteViewControllers.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        let settingViewController = SettingVC()
        settingViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        let viewControllerList = [feedViewController, followViewController, searchViewController, favoriteViewControllers, settingViewController]
        viewControllers = viewControllerList.map { let navi = UINavigationController(rootViewController: $0)
            return navi
        }
        //print(self.tabBar.layer.bounds.height)
    }

}
