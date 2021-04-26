//
//  ViewController.swift
//  12
//
//  Created by Евгений Таракин on 15.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let labelError = UILabel(frame: CGRect(origin: CGPoint(x: 21, y: 335), size: CGSize(width: 150, height: 20)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelError.text = "Enter all text fields!"
        labelError.textColor = .red
        labelError.alpha = 0
        
        allTextFields.append(loginTextField)
        allTextFields.append(passwordTextField)
        loginTextField.returnKeyType = .next
        loginTextField.keyboardType = UIKeyboardType.emailAddress
        
        passwordTextField.returnKeyType = .done
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
        
        view.addSubview(labelError)
        view.addGestureRecognizer(tapViewGestureRecognizer)
    }
    
    @IBOutlet weak var authorizationLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var entryButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    var allTextFields: [UITextField] = []
    
    @IBAction func tappedEntryButton(_ sender: Any) {
        if allTextFields[0].text == "" || allTextFields[1].text == "" {
            labelError.alpha = 1
            shakeTextField(allTextFields)
            UIView.animate(withDuration: 1.5) {
                self.labelError.alpha = 0
            }
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "TabBarController")
            navigationController?.pushViewController(controller, animated: true)
        }
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
