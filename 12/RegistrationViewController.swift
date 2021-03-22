//
//  RegistrationViewController.swift
//  12
//
//  Created by Евгений Таракин on 22.03.2021.
//

import UIKit
import KeychainSwift

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginRegistrationTextField: UITextField!
    @IBOutlet weak var passwordRegistrationTextField: UITextField!
    @IBOutlet weak var passwordRepeatRegistrationTextField: UITextField!
    
    let keychain = KeychainSwift()
    
    private lazy var tapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
    @objc func tapView() {
        loginRegistrationTextField.resignFirstResponder()
        passwordRegistrationTextField.resignFirstResponder()
        passwordRepeatRegistrationTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginRegistrationTextField {
            textField.resignFirstResponder()
            passwordRegistrationTextField.becomeFirstResponder()
        } else if textField == passwordRegistrationTextField {
            textField.resignFirstResponder()
            passwordRepeatRegistrationTextField.becomeFirstResponder()
        } else if textField == passwordRepeatRegistrationTextField {
            tapView()
        }
        return false
    }
    
    @IBAction func registrationButton(_ sender: Any) {
        view.endEditing(true)
        
        guard let login = loginRegistrationTextField.text,
              let password = passwordRegistrationTextField.text else { return }
        
        let loginAnswer = AuthorizationMockSimulator().logIn(login: login, password: password)
        
        if loginAnswer.result == true,
           let authorizationToken = loginAnswer.token {
            keychain.set(authorizationToken, forKey: ApplicationConstants.keychainTokenKey)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ThirdScene")

        navigationController?.pushViewController(controller, animated: true)
    }
    
    lazy var errorLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: CGPoint(x: 16, y: scrollView.frame.origin.y + 245), size: CGSize(width: 300, height: 16)))
        label.text = "Enter all fields!"
        label.textColor = .red
        label.font = UIFont(name: "Arial", size: 20)
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginRegistrationTextField.returnKeyType = .next
        loginRegistrationTextField.keyboardType = UIKeyboardType.emailAddress
        
        passwordRegistrationTextField.returnKeyType = .next
        
        passwordRepeatRegistrationTextField.returnKeyType = .done
        
        loginRegistrationTextField.delegate = self
        passwordRegistrationTextField.delegate = self
        passwordRepeatRegistrationTextField.delegate = self
        
        hideTitle()
                
        view.addGestureRecognizer(tapViewGestureRecognizer)
        view.addSubview(errorLabel)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil
        )
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil
        )
    }
    
    @objc func keyBoardWillShow(_ sender: Notification) {
        errorLabel.alpha = 0
        if let keyBoardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            var insets = scrollView.contentInset
            insets.bottom = keyBoardSize.height
            scrollView.contentInset = insets
        }
    }

    @objc func keyBoardWillHide(_ sender: Notification) {
        scrollView.contentInset = .zero
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
