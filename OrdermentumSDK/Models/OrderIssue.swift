//
//  OrderIssue.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 1/2/21.
//  Copyright © 2021 Ordermentum. All rights reserved.
//

import Foundation

public struct OrderIssue: Encodable {
    public init() { }

    public var id: String = ""
    public var type: String = ""
    public var orderId: String = ""
    public var comment: String = ""
    public var resolution: String?
    public var resolvedAt: String?
    public var createdAt: String = ""
    public var updatedAt: String?
    public var deletedAt: String?
    public var userId: String = ""
    public var reportedBy: OrderIssueReporter = OrderIssueReporter()
}

public struct OrderIssueReporter: Encodable {
    public init() { }

    public var id: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var email: String = ""
    public var fullName: String = ""
}

extension OrderIssue: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        comment = try container.decodeIfPresent(String.self, forKey: .comment) ?? ""
        resolution = try container.decodeIfPresent(String.self, forKey: .resolution)
        resolvedAt = try container.decodeIfPresent(String.self, forKey: .resolvedAt)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt)
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        reportedBy = try container.decodeIfPresent(OrderIssueReporter.self, forKey: .reportedBy) ?? OrderIssueReporter()
    }
}

extension OrderIssueReporter: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
    }
}
