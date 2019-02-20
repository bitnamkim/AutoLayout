//
//  PracticeViewController.swift
//  Basic_21_AutoLayout_Code_Anchor_1
//
//  Created by 흠냐방구 on 03/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newButton = UIButton.init(type: .system)
        newButton.setTitle("newButton", for: .normal)
        
        self.view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -100).isActive = true
        newButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        
        let newLabel = UILabel.init()
        newLabel.text = "new Label"
        
        self.view.addSubview(newLabel)
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        newLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 100).isActive = true
        newLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -50).isActive = true
        

        
    }
}
