//
//  ActivityDetails.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import Foundation
struct ActivityDetails : Codable
{
    var enrichments : [Enrichments]?
    var is_success: Bool?
    var metadata: Metadata?
}

struct Metadata : Codable
{
    var activity_id : Int?
    var foot_side: String?
    var seconds: Int?
    var steps: Int?
    var timestamp: Int?
    var title: String?
}

struct Enrichments : Codable
{
    var _id : String?
    var _type: String?
    var description: String?
    var subtitle: String?
    var title: String?
    var units: String?
    var value: Int?
    var value_left: Int?
    var value_right: Int?
    var message: String?
    
}

