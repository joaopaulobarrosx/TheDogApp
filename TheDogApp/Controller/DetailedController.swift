//
//  DetailedController.swift
//  TheDogApp
//
//  Created by Joao Barros on 08/07/22.
//

import UIKit

class DetailedController: UIViewController {
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    var index = 0
    
    func getName() -> [String] {
        return UserDefaults.standard.array(forKey: "nameKey")as? [String] ?? ["primeiraTela"]
    }
    func getGroup() -> [String] {
        return UserDefaults.standard.array(forKey: "groupKey")as? [String] ?? ["primeiraTela"]
    }
    func getCategory() -> [String] {
        return UserDefaults.standard.array(forKey: "forKey")as? [String] ?? ["primeiraTela"]
    }
    func getTemperament() -> [String] {
        return UserDefaults.standard.array(forKey: "tempKey")as? [String] ?? ["primeiraTela"]
    }

//    let name = UserDefaults.standard.array(forKey: "nameKey") as! [String]
//    let breed_group = UserDefaults.standard.array(forKey: "groupKey") as! [String]
//    let bred_for = UserDefaults.standard.array(forKey: "forKey") as! [String]
//    let temperament = UserDefaults.standard.array(forKey: "tempKey") as! [String]
//    let image = UserDefaults.standard.array(forKey: "imageKey") as! [String]

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async() {
            self.breedLabel.text = self.getName()[self.index]
            self.categoryLabel.text = "Category: \(self.getCategory()[self.index])"
            self.temperamentLabel.text = "Temperament: \(self.getTemperament()[self.index])"
            self.groupLabel.text = "Group: \(self.getGroup()[self.index])"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

