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
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    
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
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("2")
        }

        @IBAction func loginPressed() {
            let login = loginField.text!
            let password = passwordField.text!
            if login == "admin" && password == "123456" {
                print("успешная авторизация")
            } else {
                print("неуспешная авторизация")
            }
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




