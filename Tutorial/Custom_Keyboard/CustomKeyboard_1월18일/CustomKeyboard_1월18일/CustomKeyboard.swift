//
//  CustomKeyboard.swift
//  CustomKeyboard_1월18일
//
//  Created by 흠냐방구 on 18/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

protocol CustomKeyboardProtocol {
    func keyboardTapped(calledValue:String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardProtocol?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.keyboardTapped(calledValue: sender.titleLabel!.text!)
    }

    
}
