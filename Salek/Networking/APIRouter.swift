////
////  ApiRouter.swift
//  Salek
//
//  Created by Divo Ayman on 4/22/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
////
//
//
//import Foundation
////import Alamofire
//
//enum APIRouter: URLRequestConvertible{
//
//
//
//    // The endpoint name
//
//
//    case login(_ email: String,_ password: String)
//    case resetPass(_ email: String)
//
//    // MARK: - HttpMethod
//    private var method: HTTPMethod {
//        switch self{
//      case.login, .resetPass:
//            return .post
//
//
//        }
//    }
//    // MARK: - Parameters
//    private var parameters: Parameters? {
//        switch self {
//
//
//        case .login(let email, let pass):
//            return [ParameterKeys.email: email, ParameterKeys.pass : pass]
//
//        case .resetPass(let email):
//                      return [ParameterKeys.email: email]
//
//        default:
//            return nil
//        }
//    }
//    // MARK: - Path
//    private var path: String {
//        switch self {
//
//
//        case .login(_,_):
//            return URLs.login
//        case .resetPass(_):
//            return URLs.resetPass
//
//    }
//    }
//    // MARK: - URLRequestConvertible
//    func asURLRequest() throws -> URLRequest {
//        let url = try URLs.base.asURL()
//
//        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//
//        //httpMethod
//        urlRequest.httpMethod = method.rawValue
//
//        switch self {
//
//
//        default:
//            break
//        }
//
//
//        // Encoding
//        let encoding: ParameterEncoding = {
//            switch method {
//            case .get, .delete:
//
//                return URLEncoding.default
//            default:
//                return JSONEncoding.default
//            }
//        }()
//
//        print(try encoding.encode(urlRequest, with: parameters))
//        return try encoding.encode(urlRequest, with: parameters)
//    }
//
//}
//
//
//extension APIRouter {
//    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
//        do {
//            let anyEncodable = AnyEncodable(body)
//            let jsonData = try JSONEncoder().encode(anyEncodable)
//            let jsonString = String(data: jsonData, encoding: .utf8)!
//            print(jsonString)
//            return jsonData
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//}
//
//// type-erasing wrapper
//struct AnyEncodable: Encodable {
//    private let _encode: (Encoder) throws -> Void
//
//    public init<T: Encodable>(_ wrapped: T) {
//        _encode = wrapped.encode
//    }
//
//    func encode(to encoder: Encoder) throws {
//        try _encode(encoder)
//    }
//}
//
