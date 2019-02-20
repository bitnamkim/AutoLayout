//
//  ViewController.swift
//  Floating_Button연습
//
//  Created by 흠냐방구 on 10/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOtherButtons" {
            let floatingVC = segue.destination as! FloatingButtonsList
            
            floatingVC.modalPresentationStyle = .currentContext
            
        }
    }


}

