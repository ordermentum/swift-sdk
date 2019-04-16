//
//  Auth.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Login: Codable {
    public var access_token: String = ""
    public var token_type: String = ""
}

public struct LoginRequest: Codable {
    public init() {}
    
    public var username: String = ""
    public var password: String = ""
}

public struct ForgotPasswordRequest: Codable {
    public init() {}
    
    public var email: String = ""
}

public struct ChangePassword: Codable {
    public init() {}
    
    public var success: Bool = false
    public var message: String = ""
}

public struct ChangePasswordRequest: Codable {
    public init() {}
    
    public var userId: String = ""
    public var oldPassword: String = ""
    public var password: String = ""
    public var verifyPassword: String = ""
}
