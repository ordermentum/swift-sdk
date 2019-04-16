//
//  VenueInvite.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueInviteResponse {
    var data: [VenueInvite] = []
}

public struct VenueInvite {
    var id: String = ""
    var senderEntityName: String = ""
    var senderType: String = ""
    var senderId: String = ""
    var recipientFirstName: String = ""
    var recipientLastName: String = ""
    var recipientFullName: String = ""
    var recipientEmail: String = ""
    var recipientPhone: String = ""
    var recipientEntityName: String = ""
    var referenceId: String = ""
    var status: String = ""
    var permissions: [String] = []
    var isApproved: Bool = false
    var approvedByName: String = ""
    var createdAt: String = ""
    var createdByName: String = ""
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
