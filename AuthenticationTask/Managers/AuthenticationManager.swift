//
//  AuthenticationManager.swift
//  AuthenticationTask
//
//  Created by mac on 9/11/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class AuthenticationManager: NSObject {

    static func AuthenticateWithUserData(user: User,completionHandler : @escaping (_ isAuthenticated: AuthnticationResponse, _ error: NSError?) -> Void) {
        NetworkLayer.sharedInstance.makePostRequest(url: UrlsForApp.ResgistrationUrl, parameters: user.getUserAsDictionaryObject()) { (response, error) in
         
            completionHandler(AuthnticationResponse(json: response!), error)
            
        }
        
    }
}
