//
//  EnrichmentsCell.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class EnrichmentsCell: UITableViewCell {
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var pageControl : UIPageControl!
     
    let enrichmentHeight:Int = 311
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func initializeCell(enrichments:[Enrichments]) {
        var allEnrichmentsViews = [EnrichmentsView]()
        for enrichment in enrichments {
            let enrichmentsView:EnrichmentsView = Bundle.main.loadNibNamed("EnrichmentsView", owner: self, options: nil)?.first as! EnrichmentsView
            
            enrichmentsView.initializeView(enrichment: enrichment)
            allEnrichmentsViews.append(enrichmentsView)
        }
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 311)
        scrollView.contentSize = CGSize(width: self.frame.size.width * CGFloat(allEnrichmentsViews.count), height: 311)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< allEnrichmentsViews.count {
            allEnrichmentsViews[i].frame = CGRect(x: self.frame.size.width * CGFloat(i), y: 0, width: self.frame.size.width, height: 311)
            scrollView.addSubview(allEnrichmentsViews[i])
        }
        pageControl.numberOfPages = allEnrichmentsViews.count
        pageControl.currentPage = 0
    }
    
}
