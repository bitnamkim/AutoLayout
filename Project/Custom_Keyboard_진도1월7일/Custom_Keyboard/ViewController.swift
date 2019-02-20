//
//  ViewController.swift
//  Custom_Keyboard
//
//  Created by 흠냐방구 on 07/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
    
    // 🐷랜덤함수를 활용해서 새로운 뷰를 오픈할때마다, 키보드의 배열을 다르게 해줄 수 있음. 랜덤함수 함 알아보자.
    
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기화 해주는 뷰 디드 로드에 커스텀 키보드 콜하고 delegate 선언해주기.
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        // 번들에 있는 메인 receiver에 위치한 CustomKeyboard nib파일을 로드해줄거임. owner, option은 걍 nil 해도 된다고 함.
        // Bundle : A representation of the code and resources stored in a bundle directory on disk.
        // 문서설명 해석 : Bundle 클래스는 생성자를 열라 많이 가지고 있지만 그중에서 main을 가장 많이 씀. main 번들은 현재 실행중인 코드가 들어있는 Bundle 디렉토리를 나타냄. 그래서 앱의 경우 기본번들객체를 통해 앱과 함께 제공되는 리소스에 엑세스 할 수 있음.
        
        
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        // 첫번째 있는 nib파일을 로드할껀데 CustomKeyboard로 형변환 해주어서 로드할거임.
        // nib파일에 있는 파일의 순서대로 first... 이렇게 들어가는데, 파일순서를 카운팅 하는 방식은 배열이랑 똑같음. 처음꺼부터 0,1,2... 이렇게 해줌.

        firstTextField.inputView = myKeyboardView
        // IBOutlet 연결시켜준 텍스트 필드에 뷰를 넣어주어서, myKeyboardView라는 값을 할당시켜줄거임. 이렇게 값을 할당하면 가상의 키보드가 만들어진거임
        
        myKeyboardView.delegate = self
        // delegate = self 선언을 해줘야 delegate가 작동함. 이전 강의에서도 배운거임!
    }
    
    func keyboardTapped(calledValue: String) {
        // 새롭게 선언해준 프로토콜의 required 메써드임.
        
        let oldNumber = Int(firstTextField.text!)
        // oldNumber = newNumber 누르기 전에 누른 숫자.
        var newNumber = Int(calledValue)
        // newNumber = oldNumber 누르고 난 후에 출력된 숫자.
        
        if calledValue == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if calledValue == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        

        
        if let realNumber = newNumber {
            
            // 코드 해석 : newNumber는 옵셔널 타입인데, 만약 newNumber가 nil이 아니면 옵셔널이 아닌 타입으로 변경을 해라
            // newNumber가 nil값이 아니라면 현재 newNumber의 타입인 optional값을 없애고 optional 타입이 아닌 realNumber에 값을 할당하라.
            
            let makeNumberFormatter = NumberFormatter()
            makeNumberFormatter.numberStyle = .decimal
            // 코드해석 : 숫자들을 3자리 마다 쉼표를 표시해서 구분해줘라
            // 🐷 NumberFormatter 문서 한번 보자.
            
            if let finalFormatted = makeNumberFormatter.string(from: NSNumber(value: realNumber)){
                firstTextField.text = String(describing: finalFormatted)
                // 타입이 NSNumber라서 타입 바꿔주고 그 안에 value 값으로 realNumber를 넣어준거임.
                // finalFormatted가 옵셔널 타입이기 때문에 옵셔널 바인딩을 해주고 값을 콜해야함.
                // 🐷 이거 Optional Binding 안에 또 Optional Binding이 있는 형태임!!. 숙지 할 것. 🐷
                
            }
            
            // let finalFormatted = makeNumberFormatter.string(from: NSNumber(value: realNumber)) 선언해주고 한 줄 개행해서 firstTextField.text = String(describing: finalFormatted) 입력하기.
            // 이렇게 하면 값이 나오긴 나옴. 근데 optional 표시가 값이 호출될 때 나옴. Optional값을 String으로 바꿔주면 원래 이렇게 콜 되는거임.
            // 이렇게 옵셔널 바인딩으로 forced unwrapping 해줘야 값이 정상으로 출력됨.
            // 🐷String(describing: ~) 이 부분은 문서 참고하자. 모르는 부분임.
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}


























