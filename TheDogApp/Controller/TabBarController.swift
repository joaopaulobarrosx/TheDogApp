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
        let spinnerController = SpinnerController()

        homeController.title = "Home"
        searchController.title = "Search"
        
        self.setViewControllers([homeController, searchController], animated: false)
//        self.showDetailViewController(spinnerController, sender: nil)
//        self.present(spinnerController, animated: true)
//        self.show(spinnerController, sender: nil)
//        self.navigationController?.pushViewController(spinnerController, animated: true)
//        self.showDetailViewController(spinnerController, sender: self)
        self.present(spinnerController, animated: true, completion: nil)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["house","magnifyingglass"]
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        self.tabBar.backgroundColor = .darkGray
        self.tabBar.tintColor = .black
    }
}
