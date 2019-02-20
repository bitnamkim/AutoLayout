//
//  ViewController.swift
//  MakeGraph_1월16일
//
//  Created by 흠냐방구 on 16/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func changeMultiplierValue(value: CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
        
    }
}



class ViewController: UIViewController {

    @IBOutlet weak var graph1: NSLayoutConstraint!
    @IBOutlet weak var graph2: NSLayoutConstraint!
    @IBOutlet weak var graph3: NSLayoutConstraint!
    @IBOutlet weak var graph4: NSLayoutConstraint!
    @IBOutlet weak var graph5: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func button1Action(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1 = self.graph1.changeMultiplierValue(value: 0.3)
            self.graph2 = self.graph2.changeMultiplierValue(value: 0.4)
            self.graph3 = self.graph3.changeMultiplierValue(value: 0.5)
            self.graph4 = self.graph4.changeMultiplierValue(value: 0.6)
            self.graph5 = self.graph5.changeMultiplierValue(value: 0.7)
            
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func button2Action(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.graph1 = self.graph1.changeMultiplierValue(value: 0.9)
            self.graph2 = self.graph2.changeMultiplierValue(value: 0.8)
            self.graph3 = self.graph3.changeMultiplierValue(value: 0.7)
            self.graph4 = self.graph4.changeMultiplierValue(value: 0.6)
            self.graph5 = self.graph5.changeMultiplierValue(value: 0.5)
            
            self.view.layoutIfNeeded()
        }
        
        
    }
    

}


