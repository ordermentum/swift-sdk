//
//  SignUp.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 19/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct SignUpResponse {
    public var user: SignUpUser = SignUpUser()
    public var token: String = ""
}

public struct SignUpUser {
    public init() {}
    
    public var id: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var fullName: String = ""
    public var dob: String = ""
    public var email: String = ""
}

extension SignUpResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decodeIfPresent(SignUpUser.self, forKey: .user) ?? SignUpUser()
        token = try container.decodeIfPresent(String.self, forKey: .token) ?? ""
    }
}

extension SignUpUser: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        dob = try container.decodeIfPresent(String.self, forKey: .dob) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
    }
}
