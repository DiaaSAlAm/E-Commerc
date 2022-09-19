//
//  GridProductCollectionViewCell.swift
//  e-commerce
//
//  Created by Diaa SALAM on 31/08/2022.
//

import UIKit



class GridProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var row: Int?
    var didTappedFavoriteButtonClosure: ((_ row: Int) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 10
    }
    
    
    @IBAction func didTappedFavoriteButton(_ sender: UIButton){
        guard let row = row else {
            return
        }
        didTappedFavoriteButtonClosure?(row)
    }
    
}
