//
//  ActivityViewController.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    var activityID = 1
    @IBOutlet weak var activityView: ActivityDetailsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.initializeView()
        let activityDetailsModel = ActivityDetailsModel()
        activityDetailsModel.delegate = self
        activityDetailsModel.getActivityDetails(id: activityID)
        // Do any additional setup after loading the view.
    }
}

extension ActivityViewController:ActivityDetailsModelDelegate{
    func setActivityDetailsResult(activityDetailsResult: ActivityDetails) {
        activityView.setActivityDetailsObject(activityDetailsObject: activityDetailsResult)
    }
    
    func displayErrorAlert(title: String, messsag: String) {
        let alert = UIAlertController(title: title, message: messsag, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
