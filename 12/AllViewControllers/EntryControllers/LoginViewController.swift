//
//  ViewController.swift
//  12
//
//  Created by Евгений Таракин on 15.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.returnKeyType = .next
        loginTextField.keyboardType = UIKeyboardType.emailAddress
        
        passwordTextField.returnKeyType = .done
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
        
        view.addGestureRecognizer(tapViewGestureRecognizer)
    }
    
    
    @IBOutlet weak var authorizationLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var entryButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    
    @IBAction func tappedEntryButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "TabBarController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func tappedRegistrationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "RegistrationViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc func tapView() {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        return false
    }
    
}
