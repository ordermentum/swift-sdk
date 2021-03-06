//
//  Projection.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct ProjectionsResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Projection] = []
}

public struct Projection {
    public init() {}
    
    public var availableDeliveries: [Delivery] = []
    public var date: String = ""
    public var deliveries: [Delivery] = []
    public var hasAvailableDeliveries: Bool = false
    public var projections: [SingleProjection] = []
}

public struct Delivery {
    public init() {}
    
    public var runAt: String = ""
    public var purchaserScheduleId: String = ""
    public var scheduleName: String = ""
    public var hasScheduledOrder: Bool = false
    public var startDate: String = ""
}

public struct CardDisplay {
    public init() {}
    public var statusLabel: String = ""
    public var actionLabel: String = ""
    public var dateLabel: String = ""
    public var date: String = ""
}

public struct SingleProjection {
    public init() {}
    
    public var orderId: String = ""
    public var supplierId: String = ""
    public var timeZone: String = ""
    public var purchaserId: String = ""
    public var scheduleId: String = ""
    public var purchaserScheduleId: String = ""
    public var scheduleName: String = ""
    public var type: String = ""
    public var number: String = ""
    public var productCount: Int = 0
    public var total: Float = 0
    public var cutoff: String = ""
    public var runAt: String = ""
    public var placedById: String = ""
    public var placedByName: String = ""
    public var updatedAt: String = ""
    public var updatedById: String = ""
    public var updatedByName: String = ""
    public var cancelledByName: String = ""
    public var cancelledAt: String = ""
    public var deliveryAt: String = ""
    public var completeAt: String = ""
    public var retailerEditable: Bool = false
    public var runStatus: String = ""
    public var sequence: Float = 0
    public var state: String = ""
    public var label: String = ""
    public var isCancellable: Bool = false
    public var isCancelled: Bool = false
    public var isEditable: Bool = false
    public var isReinstatable: Bool = false
    public var isRetailerEditable: Bool = false
    public var isLocked: Bool = false
    public var color: String = ""
    public var cardDisplay: CardDisplay = CardDisplay()
}

public struct ProjectionDeleteRequest: Codable {
    public init() {}
    
    public var place: Bool = false
    public var retailerId: String = ""
    public var supplierId: String = ""
}

public struct ProjectionReinstateRequest: Codable {
    public init() {}
    
    public var date: String = ""
}

extension ProjectionsResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Projection].self, forKey: .data) ?? []
    }
}

extension Projection: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        availableDeliveries = try container.decodeIfPresent([Delivery].self, forKey: .availableDeliveries) ?? []
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        deliveries = try container.decodeIfPresent([Delivery].self, forKey: .deliveries) ?? []
        hasAvailableDeliveries = try container.safeBoolDecode(forKey: .hasAvailableDeliveries) ?? false
        projections = try container.decodeIfPresent([SingleProjection].self, forKey: .projections) ?? []
    }
}

extension Delivery: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        runAt = try container.decodeIfPresent(String.self, forKey: .runAt) ?? ""
        purchaserScheduleId = try container.decodeIfPresent(String.self, forKey: .purchaserScheduleId) ?? ""
        scheduleName = try container.decodeIfPresent(String.self, forKey: .scheduleName) ?? ""
        hasScheduledOrder = try container.safeBoolDecode(forKey: .hasScheduledOrder) ?? false
        startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
    }
}

extension CardDisplay: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        statusLabel = try container.decodeIfPresent(String.self, forKey: .statusLabel) ?? ""
        actionLabel = try container.decodeIfPresent(String.self, forKey: .actionLabel) ?? ""
        dateLabel = try container.decodeIfPresent(String.self, forKey: .dateLabel) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
    }
}

extension SingleProjection: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        orderId = try container.decodeIfPresent(String.self, forKey: .orderId) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone) ?? ""
        purchaserId = try container.decodeIfPresent(String.self, forKey: .purchaserId) ?? ""
        scheduleId = try container.decodeIfPresent(String.self, forKey: .scheduleId) ?? ""
        purchaserScheduleId = try container.decodeIfPresent(String.self, forKey: .purchaserScheduleId) ?? ""
        scheduleName = try container.decodeIfPresent(String.self, forKey: .scheduleName) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        productCount = try container.safeIntDecode(forKey: .productCount) ?? 0
        total = try container.safeFloatDecode(forKey: .total) ?? 0
        cutoff = try container.decodeIfPresent(String.self, forKey: .cutoff) ?? ""
        runAt = try container.decodeIfPresent(String.self, forKey: .runAt) ?? ""
        placedById = try container.decodeIfPresent(String.self, forKey: .placedById) ?? ""
        placedByName = try container.decodeIfPresent(String.self, forKey: .placedByName) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .updatedById) ?? ""
        updatedByName = try container.decodeIfPresent(String.self, forKey: .updatedByName) ?? ""
        cancelledByName = try container.decodeIfPresent(String.self, forKey: .cancelledByName) ?? ""
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        deliveryAt = try container.decodeIfPresent(String.self, forKey: .deliveryAt) ?? ""
        isEditable = try container.safeBoolDecode(forKey: .isEditable) ?? false
        completeAt = try container.decodeIfPresent(String.self, forKey: .completeAt) ?? ""
        retailerEditable = try container.safeBoolDecode(forKey: .retailerEditable) ?? false
        runStatus = try container.decodeIfPresent(String.self, forKey: .runStatus) ?? ""
        sequence = try container.safeFloatDecode(forKey: .sequence) ?? 0
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        label = try container.decodeIfPresent(String.self, forKey: .label) ?? ""
        isReinstatable = try container.safeBoolDecode(forKey: .isReinstatable) ?? false
        isCancelled = try container.safeBoolDecode(forKey: .isCancelled) ?? false
        isCancellable = try container.safeBoolDecode(forKey: .isCancellable) ?? false
        isLocked = try container.safeBoolDecode(forKey: .isLocked) ?? false
        isRetailerEditable = try container.safeBoolDecode(forKey: .isRetailerEditable) ?? false
        color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
        cardDisplay = try container.decodeIfPresent(CardDisplay.self, forKey: .cardDisplay) ?? CardDisplay()
    }
}

extension SingleProjection: Equatable {
    public static func == (lhs: SingleProjection, rhs: SingleProjection) -> Bool {
        return lhs.orderId == rhs.orderId
    }
    
    public func displayOrderName() -> String {
        //Check Order Name
        if !scheduleName.isEmpty {
            return scheduleName
        }
        
        //Check Order Number
        return number
    }
}

extension SingleProjection {
    public var placedBySystem: Bool {
        return self.type == "auto"
    }

    public var isStandingOrder: Bool {
        return !self.scheduleId.isEmpty
    }
    
    public var updateButtonString: String {
        if self.isStandingOrder {
            return "Update Standing Order"
        } else {
            return "Update Order"
        }
    }
}
