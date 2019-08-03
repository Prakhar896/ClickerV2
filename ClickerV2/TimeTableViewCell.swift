//
//  TimeTableViewCell.swift
//  ClickerV2
//
//  Created by ssoeuser on 27/7/19.
//  Copyright © 2019 ssoeuser. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
