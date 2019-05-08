//
//  AuthService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class AuthService {
    public init() {}
    
    /**
     * Login to the Ordermentum service.
     * Returns a Login object
     */
    public func login(_ requestObject: LoginRequest, completion: @escaping (Bool, Login?) -> ()) {
        //Build Route
        let route = AuthRouter.login(requestObject) as URLRequestConvertible
        //Call API
        Service<Login>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Request a password reset email be sent to the specified user.
     * Returns a response body which can be used to check for a 200 status which indicates a success.
     */
    public func requestPasswordReset(_ requestObject: ForgotPasswordRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = AuthRouter.requestPasswordReset(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Change the password for the logged in user.
     * Returns 'success' as true (bool value) when successful and a 'message' (string) when failure occurs
     */
    public func changePassword(userId: String, requestObject: ChangePasswordRequest, completion: @escaping (Bool, ChangePassword?) -> ()) {
        //Build Route
        let route = AuthRouter.changePassword(userId, requestObject) as URLRequestConvertible
        
        //Call API
        Service<ChangePassword>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Reset the password of a user using a password reset token
     * Returns a ResponseBody which can be used to check for a 200 response code
     */
    public func resetPassword(resetToken: String, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = AuthRouter.resetPassword(resetToken) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
    
    /**
     * Registers a user account on the Ordermentum retailer platform.
     * Returns a SignUpResponse
     */
    public func registerUser(requestObject: SignUpRequest, completion: @escaping (Bool, SignUpResponse?) -> ()) {
        //Build Route
        let route = AuthRouter.registerUser(requestObject) as URLRequestConvertible
        
        //Call API
        Service<SignUpResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
    
    /**
     * Sends an email verification to the supplied email address.
     * Returns a SignUpResponse
     */
    public func resendVerifyEmail(_ requestObject: ResendVerifyEmailRequest, completion: @escaping (Bool) -> ()) {
        //Build Route
        let route = AuthRouter.resendVerifyEmail(requestObject) as URLRequestConvertible
        
        //Call API
        Service<EmptyDecodable>().request(route: route) { (result, responseObject) in
            completion(result)
        }
    }
}
