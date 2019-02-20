//
//  ViewController.swift
//  Calc_StackView_1_2번째만든거
//
//  Created by 흠냐방구 on 03/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.masksToBounds = true
        resultLabel.layer.cornerRadius = 50
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        button1.layer.cornerRadius = button1.bounds.width / 2
    }


}

