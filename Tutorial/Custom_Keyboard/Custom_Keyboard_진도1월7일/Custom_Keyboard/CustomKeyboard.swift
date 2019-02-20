//
//  CustomKeyboard.swift
//  Custom_Keyboard
//
//  Created by 흠냐방구 on 07/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(calledValue:String)
    // delegate 선언해서 키보드 눌렸을 때 값을 ViewController에 넘겨줄거임. ViewController에서는 프로토콜 선언함으로써 인스턴스 사용 가능해짐.
    // Button의 타이틀레이블을 호출할거니까 타입은 String임!
    // Delegate 기능은 다른 파일에서 Delegate 기능을 사용하고 싶을 때 사용하는거임! 다른 파일에 클래스를 선언해줌으로써 사용가능함.
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    // 프로토콜이 사용될 수 있도록 변수를 선언해서 참조할 수 있게 해줘야함.
    // 끊어지지않고 오브젝트가 계속 남아있으면 메모리 leak이 발생함. 그래서 optional값을 설정해줘서 nil값의 여지를 주는거임. !!delegate는 보통 optional로 선언을 해줌!!
    // 위에서 선언한 delegate를 IBAction에서도 쓸 수 있게 연결해준거임.

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.keyboardTapped(calledValue: sender.titleLabel!.text!)
        
        // _ sender : UIButton으로 바꿔주는거 FlightBooking 강의에서 했음. 한번 슥 볼 것.
        // sender의 프로퍼티 titleLabel은 현재 button에 표시된 타이틀(폰트)을 나타내는거임.
        
        
    }
    
}
