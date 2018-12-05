//
//  PreferenceManager.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/5/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class PreferenceManager{
    
    static let getInstance = PreferenceManager()
    
    func setUserName(loginResponse:LoginResponse){
        UserDefaults.standard.set(loginResponse.username, forKey: "Username")
    }
    
    func isUserLoggedIn()-> Bool{
        let username = UserDefaults.standard.string(forKey: "Username")
        return username != nil && username != ""
    }
    
    func removeLoggedInUser(){
        UserDefaults.standard.set("", forKey: "Username")
    }
}
