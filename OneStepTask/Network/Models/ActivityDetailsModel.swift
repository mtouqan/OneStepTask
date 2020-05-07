//
//  ActivityDetailsModel.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import Foundation

protocol ActivityDetailsModelDelegate {
    func setActivityDetailsResult(activityDetailsResult: ActivityDetails)
    func displayErrorAlert(title:String,messsag:String)
}

class ActivityDetailsModel {
    var delegate:ActivityDetailsModelDelegate!
    func getActivityDetails(id:Int){
        SYNetworkUtils.GetActivityDetails(activityID: id, completion:{ (result) in
            switch result{
            case .success(let response):
                if response.is_success != nil{
                    self.delegate.setActivityDetailsResult(activityDetailsResult: response)
                } else {
                    self.delegate?.displayErrorAlert(title: "", messsag: "Error occured..try again later")
                }
            case .failure(let error):
                self.delegate?.displayErrorAlert(title: "", messsag: error.localizedDescription)
            }
        } )
    }
    
}
