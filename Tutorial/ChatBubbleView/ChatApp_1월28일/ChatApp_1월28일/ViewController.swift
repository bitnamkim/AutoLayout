//
//  ViewController.swift
//  ChatApp_1월28일
//
//  Created by 흠냐방구 on 28/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var chatTextViewBottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell_ID")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell_ID")
        
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func showKeyboard(noti: Notification) {
        
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let keyboardHeight = keyboardFrame.size.height
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.chatTextViewBottomConstraint.constant = keyboardHeight - self.view.safeAreaInsets.bottom
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func hideKeyboard(noti: Notification) {
        
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.chatTextViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: animationDuration) {
            self.chatTextViewBottomConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    @IBAction func sendAction(_ sender: Any) {
        
        
    }
    

}

