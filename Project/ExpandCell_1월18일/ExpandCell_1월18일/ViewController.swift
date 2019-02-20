//
//  ViewController.swift
//  ExpandCell_1월18일
//
//  Created by 흠냐방구 on 18/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    // 구조체로 담을거임
    // 구조체를 배열에 넣을거임.
    // 배열에 넣은거는 for문으로 돌려주면됨.
    
    
    struct CellData {
        var isExpand: Bool
        var descriptionLabel: String
    }
    
    var dataList = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let textArray = ["Short Short Short Short Short",
        "Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello",
        "Short Short Short Short Short",
        "Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello",
        "Short Short Short Short Short",
        "Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello",
        "Short Short Short Short Short",
        "Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello",
        "Short Short Short Short Short",
        "Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello Say Hello",
        ]
        
        for (_, value) in textArray.enumerated() {
            dataList.append(CellData.init(isExpand: true, descriptionLabel: value))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCellDataFile
        
        cell.descriptionString.text = dataList[indexPath.row].descriptionLabel
        
        if dataList[indexPath.row].isExpand == false {
            cell.descriptionString.numberOfLines = 0
        } else {
            cell.descriptionString.numberOfLines = 1
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        dataList[indexPath.row].isExpand = !dataList[indexPath.row].isExpand
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
    }


}

