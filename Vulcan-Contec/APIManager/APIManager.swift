//
//  APIManager.swift
//  Vulcan-Contec
//
//  Created by Prabu on 20/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()
    
    func callLoginAPI(login: LoginModel, completionHandler: @escaping Handler  ){
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        
        AF.request(loginUrl, method: .post
            , parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options:[] )
                        
                        if response.response?.statusCode == 200 {
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "Bad Request")))
                        }
                    }catch{
                        completionHandler(.failure(.custom(message: "Someting went wrong")))
                    }
                case .failure(let err):
                    completionHandler(.failure(.custom(message: "Bad Request Failes")))
                }
        }
    }
    
    func callSnDetailAPI(completionHandler: @escaping Handler  ){
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .authorization("Bearer \(TokenServices.tokenInstance.getToken())")
        ]
        
        AF.request(snUrl, method: .get
            , headers: headers).response { response in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options:[] )
                        
                        if response.response?.statusCode == 200 {
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "Bad Request")))
                        }
                    }catch{
                        completionHandler(.failure(.custom(message: "Someting went wrong")))
                    }
                case .failure(let err):
                    completionHandler(.failure(.custom(message: "Bad Request Failes")))
                }
        }
    }
    
}
