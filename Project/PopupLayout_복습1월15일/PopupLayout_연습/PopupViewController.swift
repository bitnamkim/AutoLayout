//
//  PopupViewController.swift
//  PopupLayout_연습
//
//  Created by 흠냐방구 on 15/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var outputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func popupButtonAction(_ sender: Any) {
        outputTextField.text = "반갑습니다!"
    }
    
    

}
