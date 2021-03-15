//
//  SupportRequest.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 23/3/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct SupportRequest: Codable {
    public init() { }
    
    public var request: SupportRequestBody = SupportRequestBody()
}

public struct SupportRequestBody: Codable {
    public init() { }
    
    public var requester: SupportRequester = SupportRequester()
    public var subject: String = ""
    public var comment: SupportComment = SupportComment()
}

public struct SupportRequester: Codable {
    public init() { }
    
    public var name: String = ""
    public var email: String = ""
}

public struct SupportComment: Codable {
    public init() { }
    
    public var body: String = ""
}
