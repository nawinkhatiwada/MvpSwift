//
//  BaseResponse.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/2/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T:Mappable>: Mappable{
    var statusCode:Int = 0
    var statusMessage:String = ""
    var data:T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        statusCode <- map["statusCode"]
        statusMessage <- map["statusMessage"]
        data <- map["response"]
    }
}
