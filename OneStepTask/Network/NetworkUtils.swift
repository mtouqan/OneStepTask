//
//  NetworkUtils.swift
//  OneStepTask
//
//  Created by Munia Touqan  on 5/7/20.
//  Copyright © 2020 Munia Touqan . All rights reserved.
//

import Alamofire
class SYNetworkUtils {
    @discardableResult
    private static func performRequest<T:Decodable>(requestURL:String ,parameters:Parameters, method:HTTPMethod, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError>)->Void) -> Void {
        AF.request(requestURL, method: method, encoding: JSONEncoding.default).responseDecodable (decoder: decoder){ (response: DataResponse<T,AFError>) in
            completion(response.result)
        }
    }
    
    static func GetActivityDetails(activityID: Int, completion:@escaping (Result<ActivityDetails,AFError>)->Void) {
       
        let requestUrl = String(format: "%@%@%@",WebServiceURLS.baseURL,WebServiceURLS.activityURL,String(activityID))
        performRequest(requestURL:requestUrl, parameters:[:],method: .get, completion: completion)
    }
    
    
    
}
