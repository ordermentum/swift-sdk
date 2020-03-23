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
    
    var ticket: SupportTicketBody = SupportTicketBody()
}

public struct SupportTicketBody: Codable {
    public init() { }
    
    var subject: String = ""
    var comment: SupportTicketComment = SupportTicketComment()
    var priority: String = ""
    var tags: [String] = []
}

public struct SupportTicketComment: Codable {
    public init() { }
    
    var body: String = ""
}
