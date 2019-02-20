//
//  PopupViewController.swift
//  Popup_Layout
//
//  Created by 흠냐방구 on 11/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var outputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 
    }
    @IBAction func closePopupAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func doneButtonAction(_ sender: Any) {
        outputTextField.text = "야무지게 환영합니다."
        
    }
    
    
    
    
    
}
