//
//  Auth.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Login: Codable {
    var access_token: String = ""
    var token_type: String = ""
}

struct LoginRequest: Codable {
    var username: String = ""
    var password: String = ""
}

struct ForgotPasswordRequest: Codable {
    var email: String = ""
}

struct ChangePassword: Codable {
    var success: Bool = false
    var message: String = ""
}

struct ChangePasswordRequest: Codable {
    var userId: String = ""
    var oldPassword: String = ""
    var password: String = ""
    var verifyPassword: String = ""
}
