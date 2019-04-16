//
//  SignUp.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 19/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct SignUpResponse {
    var user: SignUpUser = SignUpUser()
    var token: String = ""
}

public struct SignUpUser {
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String = ""
    var dob: String = ""
    var email: String = ""
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
