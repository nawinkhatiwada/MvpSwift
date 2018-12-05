//
//  UserRouter.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/5/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation

class UserRouter{
    static let getUserLocal = UserLocalImpl()
    static let getUserRemote = UserRemoteImpl()
    static let getUserRepository = UserRepositoryImpl(remoteRepo:getUserRemote, localRepo: getUserLocal)
}
