//
//  SearchController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class SearchController: UIViewController {
    
    let name = UserDefaults.standard.array(forKey: "nameKey") as! [String]
    let breed_group = UserDefaults.standard.array(forKey: "groupKey") as! [String]
    let origin = UserDefaults.standard.array(forKey: "originKey") as! [String]


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
        return name.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableViewCell

        cell.nameLabel.text = name[indexPath.row]
        cell.grupLabel.text = "Breed group: \(breed_group[indexPath.row])"
//        cell.originLabel.text = "Origin: \(origin[indexPath.row])"
        
        return cell
    }
    
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedController = DetailedController()
        self.present(detailedController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)

        print("You tapped \(indexPath.row)")
    }
}
