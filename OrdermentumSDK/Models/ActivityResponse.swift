//
//  ActivityResponse.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 1/2/21.
//  Copyright © 2021 Ordermentum. All rights reserved.
//

import Foundation

public struct ActivityResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [ActivityEvent] = []
}

public struct ActivityEvent {
    public init() { }

    public var eventId: String = ""
    public var type: String = ""
    public var description: String = ""
    public var group: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var completedAt: String?
    public var retailerId: String = ""
    public var purchaserId: String = ""
    public var purchaserName: String = ""
    public var supplierId: String = ""
    public var actionedById: String?
    public var actionedByName: String = ""
    public var data: ActivityEventData = ActivityEventData()
    public var display: ActivityEventDisplay = ActivityEventDisplay()
    public var link: String = ""
}

public struct ActivityEventData {
    public init() { }

    public var eventId: String = ""
    public var number: String = ""
    public var emailedTo: String?
    public var orderType: String = ""
    public var byRetailer: Bool = false
    public var bySupplier: Bool = false
    public var growthEngine: Bool?
    public var industryType: String?
    public var supplierName: String?
    public var growthEnginePlus: Bool?
}

public struct ActivityEventDisplay {
    public init() { }

    public var type: String = ""
    public var actionedBy: String = ""
    public var activity: String = ""
}

extension ActivityResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([ActivityEvent].self, forKey: .data) ?? []
    }
}

extension ActivityEvent: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        eventId = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        group = try container.decodeIfPresent(String.self, forKey: .group) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        completedAt = try container.decodeIfPresent(String.self, forKey: .completedAt)
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        purchaserName = try container.decodeIfPresent(String.self, forKey: .purchaserName) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        actionedById = try container.decodeIfPresent(String.self, forKey: .actionedById)
        actionedByName = try container.decodeIfPresent(String.self, forKey: .actionedByName) ?? ""
        data = try container.decodeIfPresent(ActivityEventData.self, forKey: .data) ?? ActivityEventData()
        display = try container.decodeIfPresent(ActivityEventDisplay.self, forKey: .display) ?? ActivityEventDisplay()
        link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
    }
}

extension ActivityEventData: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        eventId = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        emailedTo = try container.decodeIfPresent(String.self, forKey: .emailedTo)
        orderType = try container.decodeIfPresent(String.self, forKey: .orderType) ?? ""
        byRetailer = try container.safeBoolDecode(forKey: .byRetailer) ?? false
        bySupplier = try container.safeBoolDecode(forKey: .bySupplier) ?? false
        growthEngine = try container.safeBoolDecode(forKey: .growthEngine)
        growthEnginePlus = try container.safeBoolDecode(forKey: .growthEnginePlus)
        industryType = try container.decodeIfPresent(String.self, forKey: .industryType)
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName)
    }
}

extension ActivityEventDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        actionedBy = try container.decodeIfPresent(String.self, forKey: .actionedBy) ?? ""
        activity = try container.decodeIfPresent(String.self, forKey: .activity) ?? ""
    }
}
