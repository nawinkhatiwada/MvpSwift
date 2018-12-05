//
//  UserRemoteImpl.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class UserRemoteImpl: UserRemoteRepo {
    
    static let getInstance = UserRemoteImpl()
       
    func doLogin(loginModel: LoginModel, response: @escaping (_ result: LoginResponse)->(),
                     error: @escaping (_ message: String, _ statusCode:Int)->()){
        let username = loginModel.userName
        let password = loginModel.userPass
            let params = ["username": username, "password": password]
            MvpApiService.shared.requestData(T: LoginResponse.self,
                                                  url: Urls.loginUrl,
                                                  parameter: params,
                            success: { loginResponse in
                                response(loginResponse)
                            },failure: { message, statusCode in
                                error(message,statusCode)
                            })
        }
}
