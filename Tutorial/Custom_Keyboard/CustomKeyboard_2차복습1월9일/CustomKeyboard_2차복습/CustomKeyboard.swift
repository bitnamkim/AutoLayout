//
//  CustomKeyboard.swift
//  CustomKeyboard_2차복습
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(myParameter:String)
}

class CustomKeyboard: UIView {
    
    var delegate:CustomKeyboardDelegate?

    
    @IBAction func buttonTappedAction(_ sender: UIButton) {
        
        delegate?.keyboardTapped(myParameter: sender.titleLabel!.text!)
    }
    
    
    
}
