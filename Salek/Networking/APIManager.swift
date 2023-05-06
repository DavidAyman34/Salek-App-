////
////  CategoryAPIManager.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.

////
//
//import Foundation
////import Alamofire
//class APIManager {
//    
//
//
//}
//
//
//
//
//extension APIManager{
//    // MARK:- The request function to get results in a closure
//    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
//        
//        // Trigger the HttpRequest using AlamoFire
//        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
//            switch response.result {
//            case .success(let value):
//                completion(.success(value))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//        .responseJSON { response in
//            print(response)
//        }
//    }
//    
//}
