//
//  ChatListViewController.swift
//  e-commerce
//
//  Created by Diaa SALAM on 12/09/2022.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
    }
    
    
    func registerTableView(){
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ChatListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
     
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        
        if indexPath.row % 2 == 0 {
            cell.stackView.alignment = .leading
            cell.messageLabel.text = "Light  "
        }else{
            cell.stackView.alignment = .trailing
            cell.messageLabel.text = "Light blouse in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square \n Light blouse in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square \n Light blouse in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square "
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
