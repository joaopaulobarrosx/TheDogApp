//
//  SearchController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class SearchController: UIViewController {
    
//    let name = UserDefaults.standard.array(forKey: "nameKey") as! [String]
//    let breed_group = UserDefaults.standard.array(forKey: "groupKey") as! [String]
    let homeController = HomeController()
    
    func getGroup() -> [String] {
        return UserDefaults.standard.array(forKey: "groupKey")as? [String] ?? ["primeiraTela"]
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reusableCell")

    }

}
extension SearchController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return homeController.getName().count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableViewCell
        
        DispatchQueue.main.async() {
            cell.nameLabel.text = self.homeController.getName()[indexPath.row]
            cell.grupLabel.text = "Breed group: \(self.getGroup()[indexPath.row])"
        }
        
        return cell
    }
    
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedController = DetailedController()
        self.present(detailedController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        detailedController.index = indexPath.row
    }
}
