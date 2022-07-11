//
//  CollectionViewCell.swift
//  TheDogApp
//
//  Created by Joao Barros on 07/07/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var labelBreed: UILabel!
    
    static let identifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image: UIImage){
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
}
