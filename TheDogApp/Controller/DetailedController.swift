//
//  DetailedController.swift
//  TheDogApp
//
//  Created by Joao Barros on 08/07/22.
//

import UIKit

class DetailedController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
//    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    var index = 0
    
    let name = UserDefaults.standard.array(forKey: "nameKey") as! [String]
    let breed_group = UserDefaults.standard.array(forKey: "groupKey") as! [String]
    let bred_for = UserDefaults.standard.array(forKey: "forKey") as! [String]
    let temperament = UserDefaults.standard.array(forKey: "tempKey") as! [String]
    let image = UserDefaults.standard.array(forKey: "imageKey") as! [String]

    override func viewWillAppear(_ animated: Bool) {
        print(index)
        DispatchQueue.main.async() {
            self.breedLabel.text = self.name[self.index]
            self.categoryLabel.text = "Category: \(self.bred_for[self.index])"
            self.temperamentLabel.text = "Temperament: \(self.temperament[self.index])"
            self.groupLabel.text = "Group: \(self.breed_group[self.index])"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

