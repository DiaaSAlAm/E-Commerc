//
//  MessagesTableViewCell.swift
//  e-commerce
//
//  Created by Diaa SALAM on 05/09/2022.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.layer.cornerRadius = productImage.frame.height / 2
    }
    
}
