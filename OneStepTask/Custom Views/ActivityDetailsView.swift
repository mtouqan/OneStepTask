//
//  ActivityDetailsView.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class ActivityDetailsView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    var detailsObject: ActivityDetails = ActivityDetails()
    @IBOutlet weak var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("ActivityDetailsView", owner: self, options: nil)
        self.contentView.fixInView(self)
    }
    
    func initializeView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.removeExtraSeperatorLines()
        registerTableViewCells()
        tableView.isHidden = true
    }
    
    func setActivityDetailsObject(activityDetailsObject:ActivityDetails) {
        self.detailsObject = activityDetailsObject
        tableView.isHidden = false
        self.tableView.reloadData()
    }
    
    
    private func registerTableViewCells(){
        tableView.register(UINib(nibName:"ActivityTitleCell", bundle: .main), forCellReuseIdentifier: "ActivityTitleCell")
        tableView.register(UINib(nibName:"MetaDataCellCell", bundle: .main), forCellReuseIdentifier: "MetaDataCellCell")
        tableView.register(UINib(nibName:"EnrichmentsCell", bundle: .main), forCellReuseIdentifier: "EnrichmentsCell")
    }
}

extension ActivityDetailsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if(indexPath.row == 2){
//            return 50
//        } else if(indexPath.row == 2){
//            return 50
//        } else if(indexPath.row == 2){
//            return 311
//        }
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTitleCell", for: indexPath) as? ActivityTitleCell {
              //  let epochTime = TimeInterval(1429162809359) / 1000
                let date = Date(timeIntervalSince1970: TimeInterval(detailsObject.metadata?.timestamp ?? 0))
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
                dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
                dateFormatter.timeZone = .current
                let localDate = dateFormatter.string(from: date)
                cell.initializeCell(title: detailsObject.metadata?.title ?? "", timeStamp: String(localDate ) )
                cell.selectionStyle = .none
                return cell
            }else {
                return UITableViewCell()
            }
            
        } else if(indexPath.row == 1){
             if let cell = tableView.dequeueReusableCell(withIdentifier: "MetaDataCellCell", for: indexPath) as? MetaDataCellCell {
                cell.initializeCell(detectedSteps: String(detailsObject.metadata?.steps ?? 0), activityLength: String(detailsObject.metadata?.seconds ?? 0), phonePosition: detailsObject.metadata?.foot_side ?? "")
                           cell.selectionStyle = .none
                           return cell
                       }else {
                           return UITableViewCell()
                       }
            
        } else if(indexPath.row == 2){
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EnrichmentsCell", for: indexPath) as? EnrichmentsCell {
                cell.initializeCell(enrichments: detailsObject.enrichments ?? [])
                           cell.selectionStyle = .none
                           return cell
                       }else {
                           return UITableViewCell()
                       }
        }
         return UITableViewCell()
    }
    

}
extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}

extension UITableView {
    func removeExtraSeperatorLines() {
        tableFooterView = UIView(frame: CGRect.zero)
    }
}
