//
//  AuthService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    /**
     * Login to the Ordermentum service.
     * Returns a Login object
     */
    func login(requestObject: LoginRequest, completion: @escaping (Bool, Login?) -> ()) {
        AF.request(AuthRouter.login(requestObject) as URLRequestConvertible)
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let responseData = response.data else {
                            completion(false, nil)
                            return
                        }
                        let responseObject = try JSONSerialization.jsonObject(with: responseData) as? Login
                        completion(true, responseObject)
                    } catch {
                        completion(false, nil)
                    }
                    break
                    
                case .failure:
                    completion(false, nil)
                    break
                }
        }
        
        /**
         * Request a password reset email be sent to the specified user.
         * Returns a response body which can be used to check for a 200 status which indicates a success.
         */
        func requestPasswordReset(requestObject: ForgotPasswordRequest, completion: @escaping (Bool) -> ()) {
            AF.request(AuthRouter.requestPasswordReset(requestObject) as URLRequestConvertible)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        completion(true)
                        break
                        
                    case .failure:
                        completion(false)
                        break
                    }
            }
        }
        
        /**
         * Change the password for the logged in user.
         * Returns 'success' as true (bool value) when successful and a 'message' (string) when failure occurs
         */
        func changePassword(userId: String, requestObject: ChangePasswordRequest, completion: @escaping (Bool, ChangePassword?) -> ()) {
            AF.request(AuthRouter.changePassword(userId, requestObject) as URLRequestConvertible)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        do {
                            guard let responseData = response.data else {
                                completion(false, nil)
                                return
                            }
                            let responseObject = try JSONSerialization.jsonObject(with: responseData) as? ChangePassword
                            completion(true, responseObject)
                        } catch {
                            completion(false, nil)
                        }
                        break
                        
                    case .failure:
                        completion(false, nil)
                        break
                    }
            }
        }
        
        /**
         * Reset the password of a user using a password reset token
         * Returns a ResponseBody which can be used to check for a 200 response code
         */
        func resetPassword(resetToken: String, completion: @escaping (Bool) -> ()) {
            AF.request(AuthRouter.resetPassword(resetToken) as URLRequestConvertible)
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        completion(true)
                        break
                        
                    case .failure:
                        completion(false)
                        break
                    }
            }
        }
    }
}
