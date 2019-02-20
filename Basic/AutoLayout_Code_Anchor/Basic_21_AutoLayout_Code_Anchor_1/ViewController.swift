//
//  ViewController.swift
//  Basic_21_AutoLayout_Code_Anchor_1
//
//  Created by 흠냐방구 on 02/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 🐷🐷 Button은 CenterX, CenterY 기준으로 위치설정해야함. Center 기준으로 하지 않고 right,left 이런걸로 잡으면 위치가 이상하게 나옴. Label은 Center 기준으로 하지 않고 상하좌우 방향으로 해줘도 위치 정확하게 잘 나옴.🐷🐷
        
        let myButton = UIButton.init(type:.system)
        myButton.setTitle("myButton", for:.normal)
        
        self.view.addSubview(myButton)
        // 현재 Viewcontoroller에 View를 추가해서 그 위에 myButton을 올려놓는 코드.
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        // translate~ 이 프로퍼티는 오토 레이아웃 설정을 해주는 거임. False로 해야 오토 레이아웃으로 설정을 해준다는거임. true로 하면 오토 레이아웃 설정을 하지 않고 frame 값을 받는다는거임.
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        // 코드로 오브젝트(객체)를 만들 때, Constraint 설정이나 크기(윗쓰, 하이트)에 대한 개념이 없으면 콜되지 않음.
        // myButton에 X,Y 좌표를 주는 코드. CenterX는 객체의 상위 뷰인 self.view와 같은 값을 준거임.
        // 코드로 Constraint를 설정하면 기본적으로 비활성화 되어 있음. 그래서 .isActive = True로 활성화 시켜 줄 것!
        
        
        let myLabel = UILabel.init()
        myLabel.text = "My Label"
        self.view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 20).isActive = true
        myLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        // safeAreaLayOutGuide 프로퍼티를 사용해야 안전하게 Safe Area 안에서 오브젝트의 위치가 설정됨.
        
        
        
        
        
        
        
        
        
        
        
        let yourButton = UIButton.init(type: .system)
        yourButton.setTitle("할룽할룽", for: .normal)
        self.view.addSubview(yourButton)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        yourButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 30).isActive = true
        yourButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60).isActive = true
        
        
        let yourLabel = UILabel.init()
        yourLabel.text = "방가방가"
        self.view.addSubview(yourLabel)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        yourLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        yourLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 30).isActive = true
        
    }


}

