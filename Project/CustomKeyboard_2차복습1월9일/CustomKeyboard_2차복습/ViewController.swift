//
//  ViewController.swift
//  CustomKeyboard_2차복습
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadNib = Bundle.main.loadNibNamed("Customkeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        
        myKeyboardView.delegate = self
        
        firstTextField.inputView = myKeyboardView
        
    }
    
    
    func keyboardTapped(myParameter: String) {
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(myParameter)
        
        if myParameter == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        } else if myParameter == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber  = newNumber  {
            
            let makeNumberFormatter = NumberFormatter()
            makeNumberFormatter.numberStyle = .decimal
            
            if let finalFormatted = makeNumberFormatter.string(from: NSNumber(value: newNumber!)){
            firstTextField.text = String(describing: finalFormatted)
        }
}

}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
