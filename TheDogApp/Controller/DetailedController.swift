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
    @IBOutlet weak var imagemView: UIImageView!
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
    func getImage() -> [String] {
        return UserDefaults.standard.array(forKey: "imageKey")as? [String] ?? ["primeiraTela"]
    }
//    override init()

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async() {
            self.breedLabel.text = self.getName()[self.index]
            self.categoryLabel.text = "Category: \(self.getCategory()[self.index])"
            self.temperamentLabel.text = "Temperament: \(self.getTemperament()[self.index])"
            self.groupLabel.text = "Group: \(self.getGroup()[self.index])"
            self.imagemView.downloaded(from: self.getImage()[self.index])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

