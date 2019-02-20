//
//  ViewController.swift
//  FloatingButton_1월16일
//
//  Created by 흠냐방구 on 16/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }
    
    
    
    
}
