//
//  UserRemoteRepo.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/3/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

protocol UserRemoteRepo {
    func doLogin(loginModel: LoginModel,response: @escaping (_ result: LoginResponse)->(),
                 error: @escaping (_ message: String, _ statusCode:Int)->())
}
