//
//  ViewController.swift
//  CustomSwitch_연습
//
//  Created by 흠냐방구 on 15/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 50 / 2
        buttonBackgroundView.layer.cornerRadius = 50 / 2
        
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if buttonCenterX.constant == -95 {
            buttonCenterX.constant = 95
            buttonBackgroundView.backgroundColor = UIColor.lightGray
        } else {
            buttonCenterX.constant = 95
            buttonBackgroundView.backgroundColor = UIColor.lightGray
        }
        
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}

