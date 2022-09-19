//
//  SortByViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 31/08/2022.
//

import UIKit

protocol SortProtocol {
    func didChangedSort(title: String)
}

class SortByViewController: UIViewController {
    
    @IBOutlet var listViews: [UIView]!
    
    @IBOutlet var listLabels: [UILabel]!
    
    var delegate: SortProtocol?
    
    var sortArray: [String] = ["Price: Highest to low","Popular", "Newest", "Customer review"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        listViews.first?.backgroundColor = .red
//        listLabels.first?.textColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        }
    }
    
    
    @IBAction
    func didTappedCloseButton(_ sender: UIButton){
        dismiss(animated: false)
    }
    
    
    @IBAction func didTappedListButtons(_ sender: UIButton) {
        let title = sortArray[sender.tag]
        delegate?.didChangedSort(title: title)
        
        print("Sender tag is:", sender.tag)
        listViews.forEach({$0.backgroundColor = .white})
        listViews.first(where: {$0.tag == sender.tag })?.backgroundColor = .red
        
        for x in listLabels {
            if x.tag == sender.tag {
                x.textColor = .white
            }else{
                x.textColor = .black
            }
        }
        
    }
    
}
