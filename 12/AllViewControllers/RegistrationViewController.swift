//
//  RegistrationViewController.swift
//  12
//
//  Created by Евгений Таракин on 22.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginRegistrationTextField {
            textField.resignFirstResponder()
            passwordRegistrationTextField.becomeFirstResponder()
        } else if textField == passwordRegistrationTextField {
            textField.resignFirstResponder()
            passwordRepeatRegistrationTextField.becomeFirstResponder()
        } else if textField == passwordRepeatRegistrationTextField {
            textField.resignFirstResponder()
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginRegistrationTextField.returnKeyType = .next
        loginRegistrationTextField.keyboardType = .emailAddress
        
        passwordRegistrationTextField.returnKeyType = .next
        
        passwordRepeatRegistrationTextField.returnKeyType = .done

        loginRegistrationTextField.delegate = self
        passwordRegistrationTextField.delegate = self
        passwordRepeatRegistrationTextField.delegate = self
        
        view.addGestureRecognizer(tapViewGestureRecognizer)
    }
   
    @IBOutlet weak var loginRegistrationTextField: UITextField!
    @IBOutlet weak var passwordRegistrationTextField: UITextField!
    @IBOutlet weak var passwordRepeatRegistrationTextField: UITextField!
    
    @IBAction func tappedReadyButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "UserAuthorizationViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private lazy var tapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
    @objc func tapView() {
        loginRegistrationTextField.resignFirstResponder()
        passwordRegistrationTextField.resignFirstResponder()
        passwordRepeatRegistrationTextField.resignFirstResponder()
    }
    

}
