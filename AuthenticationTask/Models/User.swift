//
//  User.swift
//  AuthenticationTask
//
//  Created by mac on 9/11/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class User: NSObject {

    
    var Username: String!
    var Password: String!
    var Email: String!
    override init() {
        Username = ""
        Password = ""
        Email = ""
    }
    init(usernameParam: String,passwordParam: String, emailParam: String) {
        Username = usernameParam
        Password = passwordParam
        Email = emailParam
    }

    func getUserAsDictionaryObject() -> [String: Any] {
        return [JsonKeys.UserNameKey: Username, JsonKeys.UserEmailKey: Email, JsonKeys.UserPasswordKey: Password]
    }
    
}
