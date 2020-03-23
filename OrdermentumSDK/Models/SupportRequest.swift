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
    
    var request: SupportRequestBody = SupportRequestBody()
}

public struct SupportRequestBody: Codable {
    public init() { }
    
    var requester: SupportRequester = SupportRequester()
    var subject: String = ""
    var comment: SupportComment = SupportComment()
}

public struct SupportRequester: Codable {
    public init() { }
    
    var name: String = ""
    var email: String = ""
}

public struct SupportComment: Codable {
    public init() { }
    
    var body: String = ""
}
