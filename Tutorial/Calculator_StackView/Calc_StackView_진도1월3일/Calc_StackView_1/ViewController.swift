//
//  ViewController.swift
//  Calc_StackView_1
//
//  Created by 흠냐방구 on 02/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 50
        resultLabel.layer.masksToBounds = true
        // label을 동그랗게 만들려면 cornerRadius, masksToBounds 두 개 다 해줘야함. Label은 초기화 해주는 viewDidLoad에 코드 적어도 됨. 근데 버튼은 viewWillAppear에 해줘야함.
        // button1.layer.cornerRadius = button1.bounds.width / 2 이 코드를 vieDidLoad에다가 해줘도 객체에 영향을 주긴함. 근데 ViewDidLoad는 초기화 해주는 곳이라서 제대로 코드가 작동하질않음(원이긴 원인데 좀 찌그러진 원으로 구현됨). 그래서 view가 제대로 구현되는 viewDidAppear(or viewWillAppear) 에다가 cornerRadius 코드를 써줘야함.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button1.layer.cornerRadius = button1.bounds.width / 2
        button2.layer.cornerRadius = button2.bounds.width / 2
        button3.layer.cornerRadius = button3.bounds.width / 2
        button4.layer.cornerRadius = button4.bounds.width / 2
        button5.layer.cornerRadius = button5.bounds.width / 2
        button6.layer.cornerRadius = button6.bounds.width / 2
        button7.layer.cornerRadius = button7.bounds.width / 2
        button8.layer.cornerRadius = button8.bounds.width / 2
        button9.layer.cornerRadius = button9.bounds.width / 2
        button10.layer.cornerRadius = button10.bounds.height / 2
        button11.layer.cornerRadius = button11.bounds.width / 2
        
        
    }
}


