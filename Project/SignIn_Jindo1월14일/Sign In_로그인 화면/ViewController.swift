//
//  ViewController.swift
//  Sign In_로그인 화면
//
//  Created by 흠냐방구 on 14/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    // 전역변수(글로벌 변수)로 선언해줬음. 타입만 선언해줬음.
    var passwordErrorHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        // 특정한 이벤트 일 때, 실행할 메써드를 설정하게 해주는 개념.
        // 타겟이 나 자신이므로 'self'로 지정해줌.
        // action: 이 부분은 함수 이름 설정해주는곳. #selector에 기반한 함수 설정은 objective-c에 연결되지 않은 상태이면 에러가 남. 즉 objective-c에서 호환 되지 않는 상태라서, 호환되는 상태로 키워드를 지정하라! 그래서 @objc로 해주는거임.
        // for: UIControl.Event.editingChanged임.-> 텍스트필드의 값을 입력,수정,삭제 할 때 이 이벤트로 콜해주는거
        // 🐷 editingChanged 이벤트 일 때, action에 해당되는 함수가 호출되는 구조임!
        // addTarget을 하면 addTarget의 해당되는 객체 'emailTextField'를 파라미터로 넘겨줌.
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        emailErrorHeight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
        
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        // 파라미터를 이렇게 설정하면 addTarget의 객체 emailTextField가 넘어옴.
        
        if textField == emailTextField {
            // ==은 같은 오브젝트인지 확인해주는 뜻을 가지고 있음.
            print("이메일 텍스트 필드 : \(textField.text!)")
            
            if isValidEmail(email: textField.text) == true{
                
                // let emailErrorHeight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
                // emailErrorHeight.isActive = true
                // emailErrorLabel의 높이값에 0을 준거임.
                // 윗윗코드처럼 constraint 설정값을 객체로 받아줄 수 있음.
                
                // emailErrorLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
                // 이건 걍 객체로 안받고 바로 값준거.
                
                emailErrorHeight.isActive = true
                // 올바른 이메일 양식이 작성되면, 에러표시가 안나오게 해라. 그래서 Height Constant값을 0으로 준거임.
                
            } else {
                emailErrorHeight.isActive = false
                
            }
            
        }else if textField == passwordTextField {
            
            if isValidPassword(pw: textField.text) == true{
                passwordErrorHeight.isActive = true
                // 패스워드가 올바르게 입력되면, 에러 표시가 안 나오게 됨. .isActive = true는 초기화 코드로 설정해준 Constraint 값을 0으로 선언해준다는거임.
        
        } else {
            passwordErrorHeight.isActive = false
        }
        }
        
        // 이메일, 비밀번호를 올바르게 입력한 유무에 따라 textField가 팝업처럼 나오는데, 팝업처럼 나올때 애니메이션 동작을 설정해줄 수 있음.
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
            // 0.1초만큼 뷰를 갱신하라는 뜻임.
        }
        
    }
    
    // 정규식 표현 - regular expression. 구글에 검색하면 다 나옴. "swift regular expression email"
    func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
        // 오픈소스에 코드가 있긴한데, 나한테 딱 알맞게 커스터 마이징 해서 사용할려면 따로 공부해야함.
    }
    
    func isValidPassword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
            }
        }
        return true
    }

}
