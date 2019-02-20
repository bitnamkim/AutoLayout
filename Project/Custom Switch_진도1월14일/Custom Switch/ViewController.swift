//
//  ViewController.swift
//  Custom Switch
//
//  Created by 흠냐방구 on 11/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var buttonLabel: UIButton!
    // Label 아님. 잘못쓴거임.
    @IBOutlet weak var buttonBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLabel.layer.cornerRadius = 50 / 2
        // 버튼 동그랗게 해주는 코드. 버튼 '높이'의 절반으로 설정하기!
        
        buttonBackgroundView.layer.cornerRadius = 50 / 2
        // 버튼이랑 버튼백그라운드 뷰를 동그랗게 해주는 코드.
        
    }
    @IBAction func buttonACtion(_ sender: Any) {
        
        if buttonLabelCenterX.constant == 75 {
            buttonLabelCenterX.constant = -75
            buttonBackgroundView.backgroundColor = UIColor.orange
            
            // 버튼이 움직이는 위치에 따라서 버튼의 배경색을 다르게 해주는 코드
            
        } else {
            buttonLabelCenterX.constant = 75
            buttonBackgroundView.backgroundColor = UIColor.lightGray
        }
        
        UIView.animate(withDuration: 0.3) {
            // 0.3초 동안 작동되는 코드들. 이거 closure 문법이라고 함. closure 문법 숙지하자!
            self.view.layoutIfNeeded()
            // 0.3초 동안 애니메이션 효과를 적용하라!
        }
        
    }
    
}

