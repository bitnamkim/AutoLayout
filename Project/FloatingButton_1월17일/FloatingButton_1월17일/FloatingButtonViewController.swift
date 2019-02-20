//
//  FloatingButtonViewController.swift
//  FloatingButton_1월17일
//
//  Created by 흠냐방구 on 17/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    @IBOutlet weak var button1CenterX: NSLayoutConstraint!
    @IBOutlet weak var button2CenterX: NSLayoutConstraint!
    @IBOutlet weak var button3CenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1CenterX.constant = 0
        button2CenterX.constant = 0
        button3CenterX.constant = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
        
            self.button1CenterX.constant = 80
            self.button2CenterX.constant = 160
            self.button3CenterX.constant = 240
            
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            
        }
    }
    
    @IBAction func dissmissFloatingButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.button1CenterX.constant = 0
            self.button2CenterX.constant = 0
            self.button3CenterX.constant = 0
            
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            
            self.dismiss(animated: false, completion: nil)
        }
        
        
    }
    
    

    

}
