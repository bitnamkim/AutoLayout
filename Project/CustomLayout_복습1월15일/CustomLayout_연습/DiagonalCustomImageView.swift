//
//  DiagonalCustomImageView.swift
//  CustomLayout_연습
//
//  Created by 흠냐방구 on 15/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

@IBDesignable

class DiagonalCustomImageView: UIImageView {
    
    @IBInspectable var innerHeight : CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
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
        makeMask()
    }
    
}
