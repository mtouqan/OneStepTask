//
//  ActivityTitleCell.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class ActivityTitleCell: UITableViewCell {
    @IBOutlet weak var activityTitle : UILabel!
    @IBOutlet weak var activityTimeStamp : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initializeCell(title:String, timeStamp:String) {
        self.activityTitle.text = title
        self.activityTimeStamp.text = timeStamp
    }
}
