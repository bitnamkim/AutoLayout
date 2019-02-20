//
//  FloatingButtonsList.swift
//  Floating_Button연습
//
//  Created by 흠냐방구 on 10/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class FloatingButtonsList: UIViewController {
    @IBOutlet weak var wineButtonCenterY: NSLayoutConstraint!
    @IBOutlet weak var mealButtonCenterY: NSLayoutConstraint!
    @IBOutlet weak var icecreamButtonCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wineButtonCenterY.constant = 0
        mealButtonCenterY.constant = 0
        icecreamButtonCenterY.constant = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.wineButtonCenterY.constant = 80
            self.mealButtonCenterY.constant = 160
            self.icecreamButtonCenterY.constant = 240
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            
        }
    }
    
    @IBAction func dismissFloating(_ sender: Any) {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.wineButtonCenterY.constant = 0
            self.mealButtonCenterY.constant = 0
            self.icecreamButtonCenterY.constant = 0
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            self.dismiss(animated: false, completion: nil)
            
        }
        
    }
    
}
