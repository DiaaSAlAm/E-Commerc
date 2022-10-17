//
//  ViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 08/08/2022.
//

import UIKit
import MOLH

class LoginViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
  
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var newLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.addLayer()
        passwordView.addLayer()
        loginButton.addLayer()
//        newLabel.text = "LOGIN".localized
        title = "LOGIN".localized
    }
    
    
//    @IBAction func didTapped
    
    @IBAction func didPressLoginButton(_ sender: UIButton) {
        
        goToTabBar()
//        present(singupViewController, animated: true)
        print("didPressLoginButton")
    }
    
    func goToSingUp(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let singupViewController = storyboard.instantiateViewController(withIdentifier: "SingUpViewController")
        navigationController?.pushViewController(singupViewController, animated: true)
    }
    
    func goToTabBar(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tabbar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//        let nvg = UINavigationController(rootViewController: tabbar)
//        nvg.modalPresentationStyle = .fullScreen
//         present(nvg, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        let nvg = UINavigationController(rootViewController: tabbar)
        present(nvg, animated: true)
    }
    
    @IBAction func didTappedSingup(_ sender: UIButton) {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = stroyboard.instantiateViewController(withIdentifier: "SingUpViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    
    @IBAction func didTappedChangeLanguage(_ sender: UIButton){
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
    }
    
}


extension UIView {
    func addLayers(){
        self.layer.cornerRadius = 10
    }
    
}
