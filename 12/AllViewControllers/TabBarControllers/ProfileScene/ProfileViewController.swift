//
//  UserAuthorizationViewController.swift
//  12
//
//  Created by Евгений Таракин on 04.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTableView.backgroundColor = .darkGray
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UINib(nibName: "AvatarCell", bundle: nil), forCellReuseIdentifier: "AvatarCell")
        profileTableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
    }
    
    @IBAction func exitButton(_ sender: Any) {
        navigationController?.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell") as? AvatarCell
        else { return AvatarCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCell
        else { return DataCell() }
        if indexPath.row == 0 {
            cell.labelDataCell?.text = "Дата регистрации"
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = "d.LL.Y"
            cell.dateDataCell?.text = dataFormatter.string(from: Date())
            cell.dateDataCell?.isHidden = false
            cell.colorButton?.isHidden = true
        } else if indexPath.row == 1 {
            cell.labelDataCell?.text = "Цвет профиля"
            cell.dateDataCell?.isHidden = true
            cell.colorButton?.isHidden = false
            cell.colorButton?.backgroundColor = .systemPurple
            cell.colorButton?.alpha = 0.3
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        423
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        58
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
}
