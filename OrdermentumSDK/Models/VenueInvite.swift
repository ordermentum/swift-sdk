//
//  VenueInvite.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueInviteResponse {
    public var data: [VenueInvite] = []
}

public struct VenueInvite {
    public init() {}
    
    public var id: String = ""
    public var senderEntityName: String = ""
    public var senderType: String = ""
    public var senderId: String = ""
    public var recipientFirstName: String = ""
    public var recipientLastName: String = ""
    public var recipientFullName: String = ""
    public var recipientEmail: String = ""
    public var recipientPhone: String = ""
    public var recipientEntityName: String = ""
    public var referenceId: String = ""
    public var status: String = ""
    public var permissions: [String] = []
    public var isApproved: Bool = false
    public var approvedByName: String = ""
    public var createdAt: String = ""
    public var createdByName: String = ""
}

extension VenueInviteResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([VenueInvite].self, forKey: .data) ?? []
    }
}

extension VenueInvite: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        senderEntityName = try container.decodeIfPresent(String.self, forKey: .senderEntityName) ?? ""
        senderId = try container.decodeIfPresent(String.self, forKey: .senderId) ?? ""
        senderType = try container.decodeIfPresent(String.self, forKey: .senderType) ?? ""
        recipientFirstName = try container.decodeIfPresent(String.self, forKey: .recipientFirstName) ?? ""
        recipientLastName = try container.decodeIfPresent(String.self, forKey: .recipientLastName) ?? ""
        recipientFullName = try container.decodeIfPresent(String.self, forKey: .recipientFullName) ?? ""
        recipientEmail = try container.decodeIfPresent(String.self, forKey: .recipientEmail) ?? ""
        recipientPhone = try container.decodeIfPresent(String.self, forKey: .recipientPhone) ?? ""
        recipientEntityName = try container.decodeIfPresent(String.self, forKey: .recipientEntityName) ?? ""
        referenceId = try container.decodeIfPresent(String.self, forKey: .referenceId) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        permissions = try container.decodeIfPresent([String].self, forKey: .permissions) ?? []
        isApproved = try container.decodeIfPresent(Bool.self, forKey: .isApproved) ?? false
        approvedByName = try container.decodeIfPresent(String.self, forKey: .approvedByName) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        createdByName = try container.decodeIfPresent(String.self, forKey: .createdByName) ?? ""
    }
}
