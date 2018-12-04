//
//  UserRepositoryImpl.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    
    var remoteRepo: UserRemoteRepo
    
    init() {
        remoteRepo = UserRemoteImpl()
    }
    
    func doLogin(loginModel: LoginModel,
                 response: @escaping (LoginResponse) -> (),
                 error: @escaping (String, Int) -> ()) {
        
        remoteRepo.doLogin(loginModel:loginModel,response: { (loginReponse) in
            response(loginReponse) //response callback
        
        }) { (statusMessage, statusCode) in
            error(statusMessage, statusCode) //error callback
        }
    }
    
}
