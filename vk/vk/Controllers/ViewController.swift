//
//  ViewController.swift
//  vk
//
//  Created by Sergey Tretyakov on 29.03.2020.
//  Copyright © 2020 sergeotretyakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
            
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
           
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        }

        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            
            switch identifier {
            case "loginSegue":
                let auth = login()
                return auth
            default:
                return false
            }
        }
        
        func login() -> Bool {
            let login = loginField.text!
            let password = passwordField.text!
            
            switch (login, password) {
            case ("admin", "123456"):
                return true
            case ("admin", _):
                passwordError()
                return false
            default:
                loginError()
                return false
            }
        }
        
        func loginError() {
            
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Неверные имя пользователя или пароль",
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        func passwordError() {
            
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Неверный пароль",
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        @objc func keyboardWasShown(notification: Notification) {
            let userInfo = (notification as NSNotification).userInfo as! [String: Any]
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            
            scrollBottomConstraint.constant = frame.height
        }
        
        @objc func keyboardWillBeHidden(notification: Notification) {
            scrollBottomConstraint.constant = 0
        }
        
}




