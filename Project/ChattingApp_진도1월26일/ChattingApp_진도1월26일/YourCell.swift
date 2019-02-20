//
//  YourCell.swift
//  ChattingApp_진도1월26일
//
//  Created by 흠냐방구 on 27/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourCellTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
