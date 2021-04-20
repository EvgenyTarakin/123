//
//  RegistrationViewController.swift
//  12
//
//  Created by Евгений Таракин on 22.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var collectionRegistrationTextFieldsOutlets: [UITextField]!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.returnKeyType == .done {
            textField.resignFirstResponder()
            return false
        }
        
        let sortedCollectionTextFields = collectionRegistrationTextFieldsOutlets.sorted {
            $0.frame.origin.y < $1.frame.origin.y
        }

        guard textField.returnKeyType == .next,
              let index = sortedCollectionTextFields.firstIndex(of: textField),
              sortedCollectionTextFields.count > index + 1
        else { return false }
        
        let nextTextField = sortedCollectionTextFields[index + 1]
        nextTextField.becomeFirstResponder()
        
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
        
        collectionRegistrationTextFieldsOutlets[0].returnKeyType = .next
        collectionRegistrationTextFieldsOutlets[0].keyboardType = .emailAddress
        
        collectionRegistrationTextFieldsOutlets[1].returnKeyType = .next
        collectionRegistrationTextFieldsOutlets[2].returnKeyType = .done
        
        collectionRegistrationTextFieldsOutlets[0].delegate = self
        collectionRegistrationTextFieldsOutlets[1].delegate = self
        collectionRegistrationTextFieldsOutlets[2].delegate = self
        
        let tapViewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
        
        view.addGestureRecognizer(tapViewGestureRecognizer)
    }
    
    @IBOutlet weak var registrationScrollView: UIScrollView!
    
    @IBAction func tappedReadyButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "TabBarController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func tapView() {
        view.endEditing(true)
    }
    
 
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        
        if let keyBoardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            var insets = registrationScrollView.contentInset
            insets.bottom = keyBoardSize.height
            registrationScrollView.contentInset = insets
        }
    }
   
    @objc func keyboardWillHide() {
        registrationScrollView.contentInset = .zero
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        removeKeyboardNotifications()
    }
}
