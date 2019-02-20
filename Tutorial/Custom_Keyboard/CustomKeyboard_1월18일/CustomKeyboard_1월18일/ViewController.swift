//
//  ViewController.swift
//  CustomKeyboard_1월18일
//
//  Created by 흠냐방구 on 18/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardProtocol {

    
    @IBOutlet weak var firstKeyboardTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        firstKeyboardTextField.inputView = myKeyboardView
        
        myKeyboardView.delegate = self
        
    }
    
    
    func keyboardTapped(calledValue: String) {
        let oldNumber = Int(firstKeyboardTextField.text!)
        var newNumber = Int(calledValue)
        
        if calledValue == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        if calledValue == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            let makeNumberFormatter = NumberFormatter()
            
        }
        
    }


}

