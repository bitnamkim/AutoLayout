//
//  ViewController.swift
//  Expand_Cell_연습
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

struct ExpandCellData {
    var descriptionLabel : String
    var titleLabel : String
    var isExpand : Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var dataList = [ExpandCellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        let textArray = ["So short isn't it huh",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long",
                         "So short isn't it huh",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long",
                         "So short isn't it huh",
                         "So short isn't it huh",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long",
                         "Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long Too long"
                         ]
        for (index, value) in textArray.enumerated() {
            dataList.append(ExpandCellData.init(descriptionLabel: value, titleLabel: value, isExpand: true))
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! expandCell
        
        cell.titleLabel.text = dataList[indexPath.row].titleLabel
        cell.descriptionLabel.text = dataList[indexPath.row].descriptionLabel
        
        if dataList[indexPath.row].isExpand == false {
            cell.titleLabel.numberOfLines = 0
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.titleLabel.numberOfLines = 1
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataList[indexPath.row].isExpand = !dataList[indexPath.row].isExpand
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
    }


}

