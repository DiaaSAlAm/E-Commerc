//
//  ListProductCollectionViewCell.swift
//  e-commerce
//
//  Created by Diaa SALAM on 31/08/2022.
//

import UIKit

protocol FavoriteButtonProtocol {
    func didTappedFavoriteButton(_ row: Int)
}

class ListProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: FavoriteButtonProtocol?
    var row: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = 8
    }
    
    
    @IBAction func didTappedFvoriteButton(_ sender: UIButton){
        guard row != nil else {
            return
        }

        delegate?.didTappedFavoriteButton(row!)
    }

}
