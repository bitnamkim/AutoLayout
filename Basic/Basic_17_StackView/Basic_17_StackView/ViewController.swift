//
//  ViewController.swift
//  Basic_17_StackView
//
//  Created by 흠냐방구 on 31/12/2018.
//  Copyright © 2018 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let makeButton = UIButton.init(type: .system)
        makeButton.setTitle("하이염", for: .normal)
        self.view.addSubview(makeButton)
        
        makeButton.translatesAutoresizingMaskIntoConstraints = false
        
        makeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        makeButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 200).isActive = true
        
        let makeLabel = UILabel.init()
        makeLabel.text = "안녕하세여"
        self.view.addSubview(makeLabel)
        
        makeLabel.translatesAutoresizingMaskIntoConstraints = false
        makeLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 200).isActive = true
        makeLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 200).isActive = true
        
        
    }


}

