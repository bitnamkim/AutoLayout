//
//  ViewController.swift
//  Popup_Layout
//
//  Created by 흠냐방구 on 11/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 팝업을 ViewController로 만드는거임.
        // 한 개의 스토리보드에는 ViewController 하나만 들어가는게 좋음. 협업할 때 형상관리 툴 차원에서, 작업할려고 하는 모든 ViewController 들이 한 개의 storyboard에 있으면 작업하기가 어려워짐. 한 개의 storyboard에 여러개 ViewController가 들어가면 오류가 발생함.
    }

    @IBAction func showPopup(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        // 특정 스토리 보드를 불러오는거임.
        // bundle: 이거는 설정들이 들어있는 개념인데, 잘 사용하지 않음.
        
        
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        // 미리 설정한 Identifier이름으로 ViewController의 인스턴스를 가져오는 코드. 그냥 ViewController 가져오는거임.
        
        popupVC.modalPresentationStyle = .overCurrentContext
        // popupVC를 호출할 때, 반투명 색상이 있으면 적용하여 호출하는 코드. 투명하게 만들어서 팝업창이 뜰 때, 기존에 있던 main ViewController가 그대로 배경 이미지로 나타날 수 있게 만듦.
        
        self.present(popupVC, animated: false, completion: nil)
        
        // present : ViewController를 나타낸다는 개념. 팝업처럼 탁- 튀어나오게 한다는 개념. 공식같은거니까 암기하셈.
        // 애니메이션을 true로 하면 아래에서 위로 슥- 올라오는거임. 팝업이니까 false로 해줘야함.
        // completion은 closure 개념임. 써야될 코드가 있으면 이 부분에 '엔터'치고 코드 쓰면 됨. 할거 없으면 걍 nil값 할당.
    }
    
    
    
}

