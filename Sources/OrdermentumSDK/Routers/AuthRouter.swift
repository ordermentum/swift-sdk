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
    case resetPassword(String, ResetPasswordRequest)
    case registerUser(SignUpRequest)
    case verifyEmail(String)
    case resendVerifyEmail(ResendVerifyEmailRequest)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .requestPasswordReset:
            return .post
        case .changePassword:
            return .patch
        case .resetPassword:
            return .put
        case .registerUser:
            return .post
        case .verifyEmail:
            return .post
        case .resendVerifyEmail:
            return .post
        }
    }
    
    var version: String {
        switch self {
        case .resetPassword: // Not on v1?
            return ""
        default:
            return "v1/"
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .login:
            return "auth"
        case .requestPasswordReset:
            return "user/password"
        case .changePassword(let userId, _):
            return "users/\(userId)/password"
        case .resetPassword:
            return "user/password"
        case .registerUser:
            return "users/signup"
        case .verifyEmail:
            return "users/verify"
        case .resendVerifyEmail:
            return "users/send-verify"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .resetPassword(let resetToken, _):
            return ["password_reset_token": resetToken]
        case .verifyEmail(let resetToken):
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
        case .registerUser(let requestObject):
            return requestObject
        case .resendVerifyEmail(let requestObject):
            return requestObject
        case .resetPassword(_, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: version+path, method: method, parameters: parameters, body: body)
    }
}
