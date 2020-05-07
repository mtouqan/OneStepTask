//
//  MetaDataCellCell.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class MetaDataCellCell: UITableViewCell {
    @IBOutlet weak var detectedStepsLabel : UILabel!
    @IBOutlet weak var activityLengthLabel : UILabel!
    @IBOutlet weak var phonePositionLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initializeCell(detectedSteps:String, activityLength:String, phonePosition:String) {
        self.detectedStepsLabel.text = detectedSteps
        self.activityLengthLabel.text = activityLength
        self.phonePositionLabel.text = phonePosition
    }
    
}
