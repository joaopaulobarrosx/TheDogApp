//
//  HomeController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class HomeController: UIViewController {
    
    func getName() -> [String] {
        return UserDefaults.standard.array(forKey: "nameKey")as? [String] ?? ["primeiraTela"]
    }
    func getImage() -> [String] {
        return UserDefaults.standard.array(forKey: "imageKey")as? [String] ?? ["primeiraTela"]
    }
    
    private let cell = "MyCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    func indicator() {
        DispatchQueue.main.async {
            for _ in 0...10000 {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (t) in
                    if self.getName() == ["primeiraTela"] {
                        self.collectionView.isHidden = false
                        self.spinner.startAnimating()
                        self.collectionView.isHidden = true
                        self.collectionView.reloadData()
                    }else{
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                        self.collectionView.isHidden = false
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        indicator()
    }
    
    private func collectionUpdate(){
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: cell)
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionUpdate()

    }
}

extension HomeController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let detailedController = DetailedController()
        detailedController.index = indexPath.row
        self.present(detailedController, animated: true)
    }
}

extension HomeController: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getName().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        DispatchQueue.main.async() {
            cell.labelBreed.text = self.getName()[indexPath.row]
            cell.imageView.downloaded(from: self.getImage()[indexPath.row])
        }
        return cell
    }
}



