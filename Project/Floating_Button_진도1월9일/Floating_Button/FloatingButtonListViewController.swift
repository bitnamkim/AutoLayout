//
//  FloatingButtonListViewController.swift
//  Floating_Button
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class FloatingButtonListViewController: UIViewController {

    @IBOutlet weak var button1CenterY: NSLayoutConstraint!
    @IBOutlet weak var button2CenterY: NSLayoutConstraint!
    @IBOutlet weak var button3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1CenterY.constant = 0
        button2CenterY.constant = 0
        button3CenterY.constant = 0
        // 초기화 될 때는 +있는 아이콘에 붙어 있어야 애니메이션 멕였을때 쭉 펼쳐지는 모션이 나오므로 constant를 0으로 설정했음.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 아이폰 디바이스를 실행해서 오브젝트들과 화면이 보이는 시점이 viewDidAppear임.
//        ViewDidLoad - 해당 뷰컨트롤러 클래스가 생성될 때(ViewWillAppear전에 실행) 실행됩니다. Low memory와같은 특별한 경우가 아니라면 딱 한번만 실행되기 때문에 초기화 할 때 사용 할 수 있습니다.
//        ViewWillAppear - 뷰 컨트롤러가 화면에 나타나기 직전에 실행됩니다. 뷰 컨트롤러가 나타나기 직전에 항상 실행되기 때문에 해당 뷰 컨트롤러가 나타나기 직전마다 일어나는 작업들을 여기에 배치 시킬 수 있습니다.
//        ViewDidAppear - 뷰 컨트롤러가 화면에 나타난 직후에 실행됩니다. 화면에 적용될 애니메이션을 그리거나 API로 부터 정보를 받아와 화면을 업데이트 할 때 이곳에 로직을 위치시키면 좋습니다. 왜냐하면 지나치게 빨리 애니메이션을 그리거나 API에서 정보를 받아와 뷰 컨트롤러를 업데이트 할 경우 화면에 반영되지 않습니다.
//        ViewWill/DidDisappear - 뷰 컨트롤러가 화면에 나타난 직전/직후에 실행됩니다.
        
//        UIView.animate(withDuration: 1) {
//            // 이거 ⭐️closure 문법⭐️임. 이거 찾아보자. closure 안에서는 self.을 항상 선언해줘야함.
              // 이 코드도 원래 사용했는데, 밑에 damping 구문 쓰면서 안쓰게 됨. 여기서 선언한 constant 값은 아래 damping 구문으로 내려줬음.
//            self.button1CenterY.constant = 80
//            self.button2CenterY.constant = 160
//            self.button3CenterY.constant = 240
//            self.view.layoutIfNeeded()
//        }
        // 애니메이션 주는 코드. withDuration의 단위는 초(second)임.
        // UIView.animate(withDuration: 1, animations: <#T##() -> Void#>) 원래 이게 완전한 코드인데, animation: 이 부분에 값 선언할거 없으면 걍 엔터치셈. 그러면 위에 코드처럼 나옴.
        // layoutIfNeeded 메써드는 화면을 갱신해주는 거임. 즉 1초라는 시간에 맞춰서 움직임을 표현해줌.
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            
            self.button1CenterY.constant = 80
            self.button2CenterY.constant = 160
            self.button3CenterY.constant = 240
            
            self.view.layoutIfNeeded()
            // self.view.layoutIfNeeded()를 써줘야 화면이 갱신되어 Duration 시간만큼 화면이 화면이 나타남.
            
        }) { (completion) in
            // ⭐️애니메이션이 끝나는 시점일 때 사용되는 문법임. UIview.animate 선언해주면 위에 파라미터 ⭐️animations:<#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#> 이렇게 나오는데 이 때 걍 엔터치면 지금처럼 됨.

        }
        // ⭐️ 부가설명 : UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
        // 조금 더 애니메이션 효과를 주고 싶을때 사용하는 코드. UIView.animate 하고 damping 써주면 자동입력됨.
        // 파라미터 값 설정해줄때 잘 모르겠으면 바로 밑에 설명 있음. 설명 보면 되게 유용함!
        // Duration은 초 단위임. delay 값을 0으로 주면 바로 실행되는거임. Damping 값이 0에 가까울수록 객체가 흔들리는게 심해지고 1은 아예 안 흔들리는거임. initialSpringVelocity는 부드럽게 애니메이션을 시작하게 해주는 개념임. 0.5정도 주면됨. 더 자세히 알고 싶으면 Swift 애니메이션을 검색해볼것. options는 3개정도 있음. curveEaseout, curveEaseIn, curveEaseInOut 3개가 쪼금씩 다름. 설명 함 보기.
        
    }
    
    @IBAction func dismissFloating(_ sender: Any) {
        // 애니메이션 그대로 적용할꺼니까 위에 코드 그대로 복사하면됨.
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            
            self.button1CenterY.constant = 0
            self.button2CenterY.constant = 0
            self.button3CenterY.constant = 0
            self.view.layoutIfNeeded()
            // 원래 초기상태로 돌아가야하니까 constant 값을 0으로 줘야함.
            
        }) { (completion) in
            
            self.dismiss(animated: false, completion: nil)
            // 이 코드 써야 원래 메인 화면으로 들어가는거임. 애니메이션을 안 쓸꺼니까 false, completion도 안 쓸꺼니까 nil 선언.
            
        }
    }
    
    
    
    }
    


