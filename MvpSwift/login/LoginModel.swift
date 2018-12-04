//
//  LoginModel.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

struct LoginModel {
    private var username: String
    private var password: String
    init(username: String,password:String) {
        self.username = username
        self.password = password
    }
    
    var userName: String {
        get {
            return username
        }
        set(uName) {
            self.username = uName
        }
    }
    
    var userPass: String{
        get {
            return password
        }
        set(uPass) {
            self.password = uPass
        }
    }
}

    

