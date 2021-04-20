//
//  UserAuthorizationViewController.swift
//  12
//
//  Created by Евгений Таракин on 04.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backFotoProfileImage: UIImageView!
    @IBOutlet weak var avatarProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backFotoProfileImage.alpha = 0.3
        avatarProfileImage.layer.cornerRadius = 74.0
    }
    
    @IBAction func exitButton(_ sender: Any) {
        navigationController?.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
    
}
