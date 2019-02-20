//
//  DiagonalCustomImageView.swift
//  Custom Layout
//
//  Created by 흠냐방구 on 10/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

@IBDesignable
// 내가 만든 커스텀 코드를 storyboard에 있는 객체에 옵션으로 적용할 수 있게 해주는 코드.

class DiagonalCustomImageView: UIImageView {

    // 순서 1. 대각선으로 잘린 사각형을 그리셈.
    // 2. benzierPath 라는 기능이 있음. "Path를 딴다"라고 말함. 2차원적인 좌표평면에 그림을 그리는거임. 좌표를 기준으로 손으로 그림 그리는거랑 비슷함.
    // 3. 완성한 Path를 layer화 시켜야함.
    // 4. layer화 된 path를 마스킹 하셈. 마스킹이란? 만약 삼각형 path를 만들었다면, 삼각형과 이미지가 겹치는 부분만 화면에 출력됨. 즉, 삼각형 path 모양의 이미지가 출력되는거임.
    // 🐷 마스킹은 layer개념이기 때문에 path를 바로 마스킹 할 수 없음. 그래서 layer로 만들어주고 마스킹 하는거임!
    // 5. 내가 만든 커스텀 코드들이 storyboard 편집옵션에서 사용될 수 있게 하기.
    
    @IBInspectable var innerHeight : CGFloat = 0
    
    // 옵션으로 값을 넣어줘서 꺾인 사각형 만들어주는 코드. 사각형 꺾인부분 innerHeight 값에 따라 경사도가 달라짐.
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint.init(x: 0, y: 0))
//        path.move(to: CGPoint.zero)
        // 위에 2개 똑같은 코드임.
        // 맨 위 왼쪽 좌표 = (0,0)
        // CGPoint는 좌표같은 개념임.
        
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        // 라인(좌표)를 그리는 코드.
        // 1. x좌표는 화면 끝까지 가야하니까 '경계의 너비 만큼 가라 라는 코드를 써줌'. y축으로는 움직이지 않을꺼니까 0임. 이 코드의 위치는 맨 오른쪽 맨 위.
        
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        // 2. x좌표는 위 코드와 같은 상태에서 y축 맨 아래로 내려가는거니까 하이트 만큼 내려가줘야함. 이 때 위치는 맨 오른쪽 맨 아래 으로 가게되는거임.
        
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        // 3. x좌표는 맨 아래에 있고 y좌표는 그대로! 이 코드의 위치는 꺾여서 올라가는 사각형 모양을 완성해줌.
        
        path.close()
        // 4. 마지막 부분은 코드는 close() 이렇게 해줘도 되고 맨 처음 코드path.move(to: CGPoint.init(x: 0, y:0))를 똑같이 써줘도 됨.
        // 이렇게 만든 path는 바로 사용할 수 없음. path들을 layer화 해줘야함.
        
        // 🐷 외부에서도 사용할려면 리턴값을 줘야함. 리턴값을 줘야 참조가 가능함.
        
        return path
    }
    
    // path 만들고 함수를 선언해서 layer화 해주는거임.
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        // 내가 현재 가지고 있는 path 좌표의 layer를 만든거임. shapeLayer라는 인스턴스의 path는 makePath()의 cgPath라는 뜻!
        
        // UIBezierPath를 cgPath로 바꿔줘서 타입을 알맞게 설정해준거임.
        // 기본 오브젝트에는 .path 프로퍼티를 가져올 수 없으므르 shapeLayer라는 인스턴스를 만들어서 불러주는거임.
        return shapeLayer
    }
    
    // layer화 해준 path를 마스킹 하는거임.
    func makeMask() {
        self.layer.mask = pathToLayer()
        // 마스크 할 대상을 =로 할당해주면 됨.
        
    }
    
    override func layoutSubviews() {
        makeMask()
    }
    // 해당 오브젝트가 그려질 때, 자동으로 실행되는 메써드. UIViewController를 상속받은 ViewController에 있는 초기화 메써드 ViewDidLoad랑 비슷한 개념임.
    

    // 모든 layer는 벡터 방식으로, 선을 그리거나 그라데이션을 넣거나 그런 개념들을 할 수 있음. 모든 오브젝트는 layer 개념임.


}
