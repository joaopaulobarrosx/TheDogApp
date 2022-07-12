//
//  TabBarController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeController = HomeController()
        let searchController = SearchController()

        homeController.title = "Home"
        searchController.title = "Search"
        
        self.setViewControllers([homeController, searchController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house","magnifyingglass"]
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        self.tabBar.backgroundColor = .systemYellow
        self.tabBar.tintColor = .black
    }
}
