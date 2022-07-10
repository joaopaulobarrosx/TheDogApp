//
//  HomeController.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
//    let breedManager = BreedManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        breedManager.fetchBreed()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 120, height: 120)
//        collectionView.collectionViewLayout = layout
        
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me \(indexPath.row)")
        let detailedController = DetailedController()
        self.present(detailedController, animated: true)
    }
}

extension HomeController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 48
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configure(with: UIImage(named: "1024")!) //not unwrap forced
        
        return cell
    }
    
}
//extension HomeController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 120, height: 120)
//    }
//}
