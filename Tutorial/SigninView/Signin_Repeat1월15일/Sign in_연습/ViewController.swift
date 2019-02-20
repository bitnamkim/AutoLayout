//
//  ViewController.swift
//  Sign in_연습
//
//  Created by 흠냐방구 on 15/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase



class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        emailErrorHeight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    
    @objc func textFieldEdited(textField: UITextField) {
        if textField == emailTextField {
            if isValidEmail(email: textField.text) == true {
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
            
            
            } else if textField == passwordTextField {
                if isValidPassword(pw: textField.text) == true {
                    passwordErrorHeight.isActive = true
                } else {
                    passwordErrorHeight.isActive = false
                }
            }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        }
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            if user != nil {
                print("회원가입완료!!")
            }
            if error != nil {
                print("회원가입오류")
            }
        }
    }
    
    @IBAction func logInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            if user != nil {
                print("회원가입완료!!")
            }
            if error != nil {
                print("회원가입오류")
            }
        }
    }
    
    
    func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(pw:String?) -> Bool {
        if let hasNumber = pw {
            if hasNumber.count < 8 {
                return false
            }
        }
        return true
    }


}

