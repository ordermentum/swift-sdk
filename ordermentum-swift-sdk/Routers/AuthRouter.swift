//
//  AuthRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum AuthRouter: URLRequestConvertible {
    //Routes
    case login(LoginRequest)
    case requestPasswordReset(ForgotPasswordRequest)
    case changePassword(String, ChangePasswordRequest)
    case resetPassword(String)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .requestPasswordReset:
            return .get
        case .changePassword:
            return .patch
        case .resetPassword:
            return .put
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .login:
            return "auth"
        case .requestPasswordReset:
            return "user/password"
        case .changePassword(let userId):
            return "users/\(userId)/password"
        case .resetPassword:
            return "user/password"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .resetPassword(let resetToken):
            return ["password_reset_token": resetToken]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .login(let requestObject):
            return requestObject
        case .requestPasswordReset(let requestObject):
            return requestObject
        case .changePassword(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        //Setup Data
        let url = try Client.instance.baseURL.asURL()
        let timeoutSeconds: Int = 10
        
        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(Client.instance.getHeaderToken(), forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        
        //Set Conditional Body
        if body != nil {
            request.httpBody = body?.toJSONData()
        }
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
