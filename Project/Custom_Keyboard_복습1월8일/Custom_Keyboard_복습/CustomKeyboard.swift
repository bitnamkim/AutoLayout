//
//  CustomKeyboard.swift
//  Custom_Keyboard_복습
//
//  Created by 흠냐방구 on 08/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(para:String)
}

class CustomKeyboard: UIView {
    
    var delegate:CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.keyboardTapped(para: sender.titleLabel!.text!)
    }
    
}
