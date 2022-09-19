//
//  ProductDetailsViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 12/09/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImagesCollectionView: UICollectionView!
    @IBOutlet weak var recommendPrdouctCollectionView: UICollectionView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var product: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = product?.title
        changeFavoriteButtonImage()
        registerCollectionView()
    }
    
    func changeFavoriteButtonImage(){
        let image = (product?.isFavorite ?? false) ? UIImage(named: "favorite2") : UIImage(named: "favoriteUnFill")
        favoriteButton.setImage(image, for: .normal)
    }
    
    func registerCollectionView(){
        productImagesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        productImagesCollectionView.delegate = self
        productImagesCollectionView.dataSource = self
        
        
        recommendPrdouctCollectionView.register(UINib(nibName: "GridProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridProductCollectionViewCell")
        recommendPrdouctCollectionView.delegate = self
        recommendPrdouctCollectionView.dataSource = self
    
    }
    
    @IBAction func didTappedFavoriteButton(_ sender: UIButton){
       let isFavorite =  product?.isFavorite ?? false
        product?.isFavorite = !isFavorite
        changeFavoriteButtonImage()
        guard let productId = product?.id else { return }
        guard let productIsFavorite = product?.isFavorite else {return}
        let userInfo: [String: Any] = ["id": productId, "isFavorite": productIsFavorite]
        NotificationCenter.default.post(name: Notification.Name("didTappedFavoriteButton"), object: nil,userInfo: userInfo)
    }
}


extension ProductDetailsViewController: CollectionView_Delegate_DataSource_FlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case productImagesCollectionView:
            return 3
        default:
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case productImagesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.categoryNameLabel.isHidden = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridProductCollectionViewCell", for: indexPath)
            return cell
            
        }
    }
}


extension ProductDetailsViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case productImagesCollectionView:
            let width = collectionView.frame.width * 0.8
            let height = collectionView.frame.height
            return CGSize(width: width, height: height)
        default:
            let width = collectionView.frame.width / 2
            let hight = collectionView.frame.height
            return CGSize(width: width, height: hight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
