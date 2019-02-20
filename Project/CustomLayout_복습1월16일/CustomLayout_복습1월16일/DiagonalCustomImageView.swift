//
//  DiagonalCustomImageView.swift
//  CustomLayout_복습1월16일
//
//  Created by 흠냐방구 on 16/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

@IBDesignable
// IBDesignable 암기할 것.

class DiagonalCustomImageView: UIImageView {
    // 커스텀 할려고 하는 객체가 ImageView라서 UIImageView 상속받은거임.
    // 파일에 코드를 작성하여 View를 만들어야하니까 파일을 추가해준거임.
    
    // bezierPath로 path 잡아주기. 그 다음 layer화 하기. layer화 한거 masking 하기
    
    // layoutSubViews 내부로 함수를 선언해줘도 되고, layoutSubViews 밖에다 빼준다음 선언해줘도 됨. 자유임.
    @IBInspectable var innerHeight : CGFloat = 0
    // @IBInspectable 암기할 것!
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        
        path.close()
        
        return path
        
        // 외부에서 함수를 사용할려면 return값을 줘야함. 그래야 참조가 가능해짐.
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        // ViewController의 맨 처음에 초기화처럼 적용되는 ViewDidLoad랑 같은 역할하는 메써드임.
        makeMask()
    }
    

}
