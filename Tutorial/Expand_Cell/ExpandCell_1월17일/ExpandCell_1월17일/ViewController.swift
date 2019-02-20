//
//  ViewController.swift
//  ExpandCell_1월17일
//
//  Created by 흠냐방구 on 17/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

struct ExpandCellData {
    var isExapnd:Bool
    var description:String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    
    
    var dataList = [ExpandCellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let textArray = ["short short short",
                         "long long long long long long long long long long long longlong long long long long long long long long long long long long long long long",
                         "short short short",
                         "long long long long long long long long long long long longlong long long long long long long long long long long long long long long long",
                         "short short short",
                         "long long long long long long long long long long long longlong long long long long long long long long long long long long long long long",
                         "hello hello hello ",
                         "long long long long long long long long long long long longlong long long long long long long long long long long long long long long long",
                         "Ha Ha Ha",
                         "long long long long long long long long long long long longlong long long long long long long long long long long long long long long long"]
        for (index, value) in textArray.enumerated() {
            dataList.append(ExpandCellData.init(isExapnd: true, description: value))
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataList[indexPath.row].description
        
        if dataList[indexPath.row].isExapnd == false {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataList[indexPath.row].isExapnd = !dataList[indexPath.row].isExapnd
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
        
    }
    
}



