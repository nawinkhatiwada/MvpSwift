//
//  ApiService.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/2/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class MvpApiService {
   
    static let getInstance = MvpApiService()
    
    func requestData <T:Mappable>(T:T.Type,
                                  url:String,
                                  parameter:Parameters,
                              success: @escaping (_ result: T)->(),
                              failure: @escaping (_ message: String, _ statusCode:Int)->()){
    
    Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: [:]).responseObject {
        (response:DataResponse<BaseResponse<T>>) in
        
        let baseRes = response.result.value
        if(baseRes != nil){
            let data = baseRes?.data
            let statusCode = baseRes?.statusCode
            let statusMessage = baseRes?.statusMessage
            if(data != nil){
                success((baseRes?.data )!)
            }else{
                failure(statusMessage!, statusCode!)
            }
        }else{
           failure("Server Error",500)
        }
    }
}
    
    
}
