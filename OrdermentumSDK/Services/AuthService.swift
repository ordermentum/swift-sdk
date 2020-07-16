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
    public init() { }

    /**
     * Login to the Ordermentum service.
     * Returns a Login object
     */
    public func login(_ requestObject: LoginRequest, completion: @escaping (Bool, Login?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.login(requestObject) as URLRequestConvertible
        //Call API
        Service<Login, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Request a password reset email be sent to the specified user.
     * Returns a response body which can be used to check for a 200 status which indicates a success.
     */
    public func requestPasswordReset(_ requestObject: ForgotPasswordRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.requestPasswordReset(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Change the password for the logged in user.
     * Returns 'success' as true (bool value) when successful and a 'message' (string) when failure occurs
     */
    public func changePassword(userId: String, requestObject: ChangePasswordRequest, completion: @escaping (Bool, ChangePassword?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.changePassword(userId, requestObject) as URLRequestConvertible

        //Call API
        Service<ChangePassword, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Reset the password of a user using a password reset token
     * Returns a ResetPasswordResponse
     */
    public func resetPassword(resetToken: String, requestObject: ResetPasswordRequest, completion: @escaping (Bool, ResetPasswordResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.resetPassword(resetToken, requestObject) as URLRequestConvertible

        //Call API
        Service<ResetPasswordResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Registers a user account on the Ordermentum retailer platform.
     * Returns a SignUpResponse
     */
    public func registerUser(requestObject: SignUpRequest, completion: @escaping (Bool, SignUpResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.registerUser(requestObject) as URLRequestConvertible

        //Call API
        Service<SignUpResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }

    /**
     * Verify an account using a token
     * Returns a response to check for success or fail
     */
    public func verifyEmail(_ passwordResetToken: String, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.verifyEmail(passwordResetToken) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }

    /**
     * Sends an email verification to the supplied email address.
     * Returns if Success or Fail
     */
    public func resendVerifyEmail(_ requestObject: ResendVerifyEmailRequest, completion: @escaping (Bool, ErrorResponse?) -> Void) {
        //Build Route
        let route = AuthRouter.resendVerifyEmail(requestObject) as URLRequestConvertible

        //Call API
        Service<EmptyDecodable, ErrorResponse>().request(route: route) { (result, _, errorObject) in
            completion(result, errorObject)
        }
    }
}
