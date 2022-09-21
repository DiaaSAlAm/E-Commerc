//
//  NewCollctionViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 24/08/2022.
//

import UIKit


class ProductModel {
    var id: Int
    var image: String
    var title: String
    var des: String
    var price: Int
    var isFavorite: Bool
    
    init(id: Int, image: String, title: String, des: String, price: Int, isFavorite: Bool = false){
        self.id = id
        self.image = image
        self.title = title
        self.des = des
        self.price = price
        self.isFavorite = isFavorite
    }
    
}

class NewCollctionViewController: UIViewController, SortProtocol, FavoriteButtonProtocol {

    @IBOutlet weak var subCategoriesCollectionView: UICollectionView!
    @IBOutlet weak var gridListButton: UIButton!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var sortButton: UIButton!
    
    
    let images: [UIImage] = [UIImage(named: "lunchScreen")!,UIImage(named: "category1")!,UIImage(named: "category2")!]
    let subCategoriesNames: [String] = ["T-shirts", "Crop tops", "Hoodies", "ddd"]
    
    var isList: Bool = true
    
    var productModelArray: [ProductModel] = [
        ProductModel(id: 1, image: "Pullover", title: "Pullover", des: "Mango", price: 51),
        ProductModel(id: 2, image: "T-shirt", title: "T-shirt", des: "Dorothy Perkins", price: 34),
        ProductModel(id: 2, image: "Shirt", title: "Shirt", des: "Topshirt", price: 99)
    ]
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addObserver()
        registerCollectionView()
    }
     
    func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(favoriteNotificationCenterChanges(_:)), name: Notification.Name("didTappedFavoriteButton"), object: nil)
    }
    
    @objc func favoriteNotificationCenterChanges(_ notification: Notification){
      
        if let id = notification.userInfo?["id"] as? Int {
            print("Product id is", id)
            
            if let isFavorite = notification.userInfo?["isFavorite"] as? Bool {
                print("Product isFavorite is:", isFavorite)
                
                productModelArray.first(where: {$0.id == id})?.isFavorite = isFavorite
                productsCollectionView.reloadData()
            } 
        }
        
    }
    
    func registerCollectionView(){
        subCategoriesCollectionView.register(UINib(nibName: "SubCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SubCategoriesCollectionViewCell")
        subCategoriesCollectionView.delegate = self
        subCategoriesCollectionView.dataSource = self
        
        productsCollectionView.register(UINib(nibName: "GridProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridProductCollectionViewCell")
        
        productsCollectionView.register(UINib(nibName: "ListProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListProductCollectionViewCell")
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
    
    @IBAction func didTappedGrid_ListButton(_ sender: UIButton) {
        isList.toggle()
        let imageList = UIImage(named: "list")
        let imageGrid = UIImage(named: "grid")
        let image = isList == true ? imageGrid : imageList
        gridListButton.setImage(image, for: .normal)
        productsCollectionView.reloadData()
    }
    
    @IBAction func didTapppedSortButton(_ sender: UIButton) {
        print("didTapppedSortButton§")
        goToSortViewController()
    }
    
    
    func goToSortViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SortByViewController") as! SortByViewController
        viewController.delegate = self
        viewController.modalPresentationStyle = .overFullScreen
        
        let transtion = CATransition()
        transtion.duration = 0.2
        transtion.type = .fade
        view.window?.layer.add(transtion, forKey: kCATransition)
        present(viewController, animated: false)
    }
    
    //MARK: - Protocol
    
    func didChangedSort(title: String) {
        sortButton.setTitle(title, for: .normal)
    }
    
    
    
    
}


extension NewCollctionViewController : CollectionView_Delegate_DataSource_FlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productModelArray[indexPath.row]
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        viewController.product = product
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == subCategoriesCollectionView {
            return 2
        }else if collectionView == productsCollectionView {
            return productModelArray.count
        }else{
            return 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case subCategoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCategoriesCollectionViewCell", for: indexPath) as!  SubCategoriesCollectionViewCell
            cell.categoryNameLabel.text = subCategoriesNames[indexPath.row]
            return cell
        default:
            if isList == true {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListProductCollectionViewCell", for: indexPath) as! ListProductCollectionViewCell
                let model = productModelArray[indexPath.row]
                cell.productImage.image = UIImage(named: model.image)
                cell.titleLabel.text = model.title
                cell.desLabel.text = model.des
                cell.priceLabel.text = "$ \(model.price)"
                cell.delegate = self
                cell.row = indexPath.row
                let image = model.isFavorite == true ? UIImage(named: "favorite2") : UIImage(named: "favoriteUnFill")
                cell.favoriteButton.setImage(image, for: .normal)
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridProductCollectionViewCell", for: indexPath) as! GridProductCollectionViewCell
                let model = productModelArray[indexPath.row]
                cell.productImage.image = UIImage(named: model.image)
                cell.titleLabel.text = model.title
                cell.desLabel.text = model.des
                cell.priceLabel.text = "$ \(model.price)"
                cell.row = indexPath.row
                let image = model.isFavorite == true ? UIImage(named: "favorite2") : UIImage(named: "favoriteUnFill")
                cell.favoriteButton.setImage(image, for: .normal)
                cell.didTappedFavoriteButtonClosure = { [weak self] row in
                    guard let self = self else {return}
                    self.didTappedFavoriteButton(row)
                }
                return cell
            }
            
        }
    }
    
    func didTappedFavoriteButton(_ row: Int) {
        let isFavorite = productModelArray[row].isFavorite
        print(isFavorite)
        productModelArray[row].isFavorite = !isFavorite
        productsCollectionView.reloadData()
    }
    
    
}


extension NewCollctionViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case subCategoriesCollectionView:
            let width = view.frame.width
            let height = collectionView.frame.height - 16
            return CGSize(width: width / 3, height: height)
        default:
            if isList == true {
                let width = collectionView.frame.width
                return CGSize(width: width, height: 150)
            }else{
                let width = collectionView.frame.width
                return CGSize(width: width / 2, height: 236)
            }
            
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
