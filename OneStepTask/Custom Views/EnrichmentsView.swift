
//
//  EnrichmentsView.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class EnrichmentsView: UIView {
    
    @IBOutlet weak var mainView : UIView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subTitleLabel : UILabel!
    @IBOutlet weak var iconImageView : UIImageView!
    @IBOutlet weak var singleValueView : UIView!
    @IBOutlet weak var stackView : UIStackView!
    @IBOutlet weak var goalAcheivedLabel : UILabel!
    @IBOutlet weak var singleValueLabel : UILabel!
    @IBOutlet weak var singleValueDescription : UILabel!
    @IBOutlet weak var leftValueLabel : UILabel!
    @IBOutlet weak var rightValueLabel : UILabel!
    @IBOutlet weak var message : UILabel!
    
     
    func initializeView(enrichment:Enrichments) {
        self.mainView.layer.borderWidth = 1
        self.mainView.layer.borderColor = UIColor.gray.cgColor
        self.mainView.layer.cornerRadius = 10
        titleLabel.text = enrichment.title
        subTitleLabel.text = enrichment.subtitle
        if(enrichment._type == "simple"){
            singleValueView.isHidden = false
            stackView.isHidden = true
            singleValueLabel.text = String(enrichment.value ?? 0)
            singleValueDescription.text = enrichment.description ?? ""
        } else if(enrichment._type == "dual"){
            singleValueView.isHidden = true
            stackView.isHidden = false
            leftValueLabel.text = String(enrichment.value_left ?? 0)
            rightValueLabel.text = String(enrichment.value_right ?? 0)

        }else if(enrichment._type == "insight"){
            singleValueView.isHidden = true
            stackView.isHidden = true
            leftValueLabel.text = String(enrichment.value_left ?? 0)
            rightValueLabel.text = String(enrichment.value_right ?? 0)
            goalAcheivedLabel.isHidden = true
            message.text = enrichment.message
            message.isHidden = false

        }
       

        if(enrichment._id == "STEP_RATE"){
            iconImageView.image = UIImage.init(named: "step_rate")
        } else if(enrichment._id == "HIP_RANGE"){
            iconImageView.image = UIImage.init(named: "hip")
        }else if(enrichment._id == "SYMMETRY"){
            iconImageView.image = UIImage.init(named: "symetry")
        }else if(enrichment._id == "STEP_LENGTH"){
            iconImageView.image = UIImage.init(named: "step")
        } else if(enrichment._id == "STANCE"){
            iconImageView.image = UIImage.init(named: "stance")
        }else if(enrichment._id == "INSIGHT"){
            iconImageView.image = UIImage.init(named: "insight")
        }
        
        
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
