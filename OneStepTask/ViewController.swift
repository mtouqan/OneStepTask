//
//  ViewController.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
         
    }
    
    @IBAction func displayActivity() {
        let activityViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "ActivityViewController") as! ActivityViewController
        activityViewController.activityID = 1
        self.present(activityViewController, animated: true, completion: nil)
    }


}

