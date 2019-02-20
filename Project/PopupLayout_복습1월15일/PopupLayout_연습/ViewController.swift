//
//  ViewController.swift
//  PopupLayout_연습
//
//  Created by 흠냐방구 on 15/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func popupButtonAction(_ sender: Any) {
        let popupVCStoryboard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        let popupVC = popupVCStoryboard.instantiateViewController(withIdentifier: "popupVC")
        
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: false, completion: nil)
        
    }
    
    

}

