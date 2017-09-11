//
//  NetworkLayer.swift
//  AuthenticationTask
//
//  Created by mac on 9/11/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class NetworkLayer: NSObject {
    public static let sharedInstance = NetworkLayer()
    func makePostRequest(url: String, parameters: [String: Any],completionHandler : @escaping (_ responseData: NSDictionary?, _ error: NSError?) -> Void) {
        
        //check if url exists
        guard let url = NSURL(string: url) else {
                return
        }
        
        var requestUrl = URLRequest(url: url as URL)
        requestUrl.httpMethod = "POST"
        do {
            requestUrl.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        catch  _  {
            print("error in parsing params to JSON")
            return
        }
        

        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: requestUrl) { (responseDataFromRequest, responseUrl, error) in
            do
            {
                    let resultJson = try JSONSerialization.jsonObject(with: responseDataFromRequest!, options: .allowFragments)

                    completionHandler(resultJson as? NSDictionary, nil)
            }
            catch _ {
                completionHandler(nil, error! as NSError)
            }

        }
        task.resume()
    }

}
