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
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        DispatchQueue.main.async() {
            cell.labelBreed.text = self.getName()[indexPath.row]
            cell.imageView.downloaded(from: self.getImage()[indexPath.row])
        }
        return cell
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

