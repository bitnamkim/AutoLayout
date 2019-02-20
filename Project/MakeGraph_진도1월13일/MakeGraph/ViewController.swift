//
//  ViewController.swift
//  MakeGraph
//
//  Created by 흠냐방구 on 10/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit


extension NSLayoutConstraint {
    // extension은 기능을 강제로 구현해놓은거임. 기존에 있던 NSLayoutConsgtraint에 Multiplier 값을 조정할 수 있게 기능을 추가해준거임.
    
    // NSLayoutConstraint 형태에 추가적으로 기능을 만들어줄거임.
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        // self는 NSLayoutConstraint 자신을 뜻하는거임.
        
        NSLayoutConstraint.deactivate([self])
        // 기존에 설정 되어있던 모든 Constraint를 비활성화 시켜주는 코드. 이렇게 해야지 Constraint 설정이 겹치지 않음.
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        // Constraint에서 Multiplier 값만 빼고 나머지는 다 기존 Constraint들은 내가 설정해준 그대로임. Multiplier 값만 내가 커스텀하게 바꿀 수 있게 하는거임!
        
        NSLayoutConstraint.activate([newConstraint])
        // newConstraint라고 새롭게 선언해준 상수에 있는 Constraint 값을 활성화 시켜주는거임.
        
        return newConstraint
        // 새로운 constraint 값을 리턴 받는거임!
        
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NSLayoutConstraint를 새로 만들어서 Multiplier 값을 새로 지정해줄거임. Multiplier값이 get-only이기 때문에 extension 으로 새로 객체, 새로운 기능을 만들어서 Multiplier 값 설정해줘야함!
        
//        graph1Height = graph1Height.changeMultiplier(value: 0.9)
//        graph2Height = graph2Height.changeMultiplier(value: 0.8)
//        graph3Height = graph3Height.changeMultiplier(value: 0.7)
//        graph4Height = graph4Height.changeMultiplier(value: 0.5)
//        graph5Height = graph5Height.changeMultiplier(value: 0.9)
        
        
        // 버튼을 누르면 그래프 크기가 달라지게 해주는 설정을 해줄려면 초기화 하는 곳(viewDidLoad)에 하이트 설정을 없애고 밑에 버튼 액션 부분에 하이트 설정을 해주면 됨!
        
    }
    
        
//        graph1Height = graph1Height.changeMultiplier(value: 0.3)
//        graph2Height = graph2Height.changeMultiplier(value: 0.5)
//        graph3Height = graph3Height.changeMultiplier(value: 0.6)
//        graph4Height = graph4Height.changeMultiplier(value: 0.7)
//        graph5Height = graph5Height.changeMultiplier(value: 0.8)
        // 애니메이션 동작 설정 안하고 걍 그래프 나타낼려면 위에 설정값만 주면 됨. 근데 애니메이션 주고 싶으면 아래처럼 UIView.animate~ 이거 해줘야함.
    
    
    

    @IBAction func firstButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(value: 0.3)
            self.graph2Height = self.graph2Height.changeMultiplier(value: 0.5)
            self.graph3Height = self.graph3Height.changeMultiplier(value: 0.6)
            self.graph4Height = self.graph4Height.changeMultiplier(value: 0.7)
            self.graph5Height = self.graph5Height.changeMultiplier(value: 0.8)
            
            self.view.layoutIfNeeded()
            // 뷰 갱신 시키는 코드
        }
    }
    

//        graph1Height = graph1Height.changeMultiplier(value: 0.9)
//        graph2Height = graph2Height.changeMultiplier(value: 0.7)
//        graph3Height = graph3Height.changeMultiplier(value: 0.6)
//        graph4Height = graph4Height.changeMultiplier(value: 0.5)
//        graph5Height = graph5Height.changeMultiplier(value: 0.7)
        
    
    @IBAction func secondButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1Height = self.graph1Height.changeMultiplier(value: 0.9)
            self.graph2Height = self.graph2Height.changeMultiplier(value: 0.7)
            self.graph3Height = self.graph3Height.changeMultiplier(value: 0.6)
            self.graph4Height = self.graph4Height.changeMultiplier(value: 0.5)
            self.graph5Height = self.graph5Height.changeMultiplier(value: 0.7)
            
            self.view.layoutIfNeeded()
        }
    }
    
}
