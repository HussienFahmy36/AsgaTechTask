//
//  AuthnticationResponse.swift
//  AuthenticationTask
//
//  Created by mac on 9/11/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class AuthnticationResponse: NSObject {
    var isSuccess: Bool?
    
    
    init(json: NSDictionary) {
        
        let userID = json[JsonKeys.Id] as! Int
        guard userID > 0  else{
                isSuccess = false
                return
        }
        isSuccess = true
        
        
        
    }
}
