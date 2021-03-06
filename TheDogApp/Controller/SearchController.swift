//
//  SearchController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class SearchController: UIViewController {
    
    func getName() -> [String] {
        return UserDefaults.standard.array(forKey: "nameKey")as? [String] ?? ["primeiraTela"]
    }
    func getGroup() -> [String] {
        return UserDefaults.standard.array(forKey: "groupKey")as? [String] ?? ["primeiraTela"]
    }
    func getId() -> [Int] {
        return UserDefaults.standard.array(forKey: "idKey")as? [Int] ?? [0]
    }
    
    var filteredData: [String] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private func tableUpdate(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
        searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableUpdate()
        filteredData = getName()

    }
    
}

extension SearchController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! TableViewCell
        
        DispatchQueue.main.async() {
            cell.nameLabel.text = self.filteredData[indexPath.row]
            cell.grupLabel.text = "Breed group: \(self.filteredData[indexPath.row])"
        }
        return cell
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedController = DetailedController(index: getId()[indexPath.row])
        self.present(detailedController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
//        let id = getId()[indexPath.row]
//        detailedController.index = id
    }
}

extension SearchController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = getName()
        } else {
            for nomes in getName() {
                if nomes.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(nomes)
                }
            }
        }
        self.tableView.reloadData()
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

