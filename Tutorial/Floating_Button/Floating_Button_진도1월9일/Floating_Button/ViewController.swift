//
//  ViewController.swift
//  Floating_Button
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            // 지금 형변환 해준건 Down Casting임.
            // Down Casting - 여러가지 타입을 포함하는 상위 타입에서 특정타입(하위타입)으로 형변환 하는것. as!는 값이 항상 있는 것으로 선언한거임. nil값 제거. 하위타입을 선택하는거임.
            // Up Casting - 하위 타입에서 여러가지 타입을 포함하는 상위 타입으로 형변환 하는거. optional값도 선언하는거임. nil값 포함. 부모타입을 선택하는거임.
            floatingVC.modalPresentationStyle = .overCurrentContext
            // 해당하는 VC의 view를 투명해줘서 배경을 투명하고 흐릿하게 만들어주는 코드.
            // 이 코드랑 같이 View의 배경색 설정을 없음으로 해야함.
        }
    }


}

