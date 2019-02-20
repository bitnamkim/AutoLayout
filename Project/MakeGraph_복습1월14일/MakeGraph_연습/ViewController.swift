//
//  ViewController.swift
//  MakeGraph_연습
//
//  Created by 흠냐방구 on 14/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit


extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        
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

    
    
    @IBOutlet weak var graph1Width: NSLayoutConstraint!
    @IBOutlet weak var graph2Width: NSLayoutConstraint!
    @IBOutlet weak var graph3Width: NSLayoutConstraint!
    @IBOutlet weak var graph4Width: NSLayoutConstraint!
    @IBOutlet weak var graph5Width: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func style1ButtonAction(_ sender: Any ) {
        UIView.animate(withDuration: 0.5) {
            
            self.graph1Width = self.graph1Width.changeMultiplier(value: 0.6)
            self.graph2Width = self.graph2Width.changeMultiplier(value: 0.6)
            self.graph3Width = self.graph3Width.changeMultiplier(value: 0.6)
            self.graph4Width = self.graph4Width.changeMultiplier(value: 0.6)
            self.graph5Width = self.graph5Width.changeMultiplier(value: 0.6)
            
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func style2ButtonAction(_ sender: Any) {
        
        
        graph1Width = graph1Width.changeMultiplier(value: 0.9)
        graph2Width = graph2Width.changeMultiplier(value: 0.8)
        graph3Width = graph3Width.changeMultiplier(value: 0.7)
        graph4Width = graph4Width.changeMultiplier(value: 0.6)
        graph5Width = graph5Width.changeMultiplier(value: 0.5)
        
        UIView.animate(withDuration: 0.5) {
//            self.graph1Width = self.graph1Width.changeMultiplier(value: 0.9)
//            self.graph2Width = self.graph2Width.changeMultiplier(value: 0.8)
//            self.graph3Width = self.graph3Width.changeMultiplier(value: 0.7)
//            self.graph4Width = self.graph4Width.changeMultiplier(value: 0.6)
//            self.graph5Width = self.graph5Width.changeMultiplier(value: 0.5)
            
            self.view.layoutIfNeeded()
        }
    }
    
    
    

}

