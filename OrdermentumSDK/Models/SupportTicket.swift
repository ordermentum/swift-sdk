//
//  SupportTicket.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 23/3/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct SupportTicket: Codable {
    public init() { }
    
    public var ticket: SupportTicketBody = SupportTicketBody()
}

public struct SupportTicketBody: Codable {
    public init() { }
    
    public var subject: String = ""
    public var comment: SupportTicketComment = SupportTicketComment()
    public var priority: String = ""
    public var tags: [String] = []
}

public struct SupportTicketComment: Codable {
    public init() { }
    
    public var body: String = ""
}
