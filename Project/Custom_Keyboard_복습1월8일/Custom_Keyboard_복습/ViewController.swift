//
//  ViewController.swift
//  Custom_Keyboard_복습
//
//  Created by 흠냐방구 on 08/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit


class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        firstTextField.inputView = myKeyboardView
        
        myKeyboardView.delegate = self
        
        
        
    }
    func keyboardTapped(para: String) {
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(para)
        
        if para == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        } else if para == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let realNumber = newNumber {
            
            let makeNumberFormatter = NumberFormatter()
            makeNumberFormatter.numberStyle = .decimal
            
            if let lastFormatted = makeNumberFormatter.string(from: NSNumber(value: realNumber)) {
                firstTextField.text = String(describing: lastFormatted)
            }
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

