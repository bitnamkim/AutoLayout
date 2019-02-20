//
//  WeatherCell.swift
//  JSONParser_1월28일
//
//  Created by 흠냐방구 on 28/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
