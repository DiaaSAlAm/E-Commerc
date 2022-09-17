//
//  SortByViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 31/08/2022.
//

import UIKit

class SortByViewController: UIViewController {
    
    @IBOutlet var listViews: [UIView]!
    
    @IBOutlet var listLabels: [UILabel]!
    
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
