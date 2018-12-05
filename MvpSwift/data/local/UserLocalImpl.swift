//
//  UserLocalRepository.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/5/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class UserLocalImpl: UserLocalRepo{
    
    var prefs = PreferenceManager.getInstance
    
    func saveUsername(loginResponse: LoginResponse) {
        prefs.setUserName(loginResponse: loginResponse)
    }
    
    func isUserLoggedIn() -> Bool {
        return prefs.isUserLoggedIn()
    }
}
