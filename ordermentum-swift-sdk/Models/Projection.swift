//
//  Projection.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct ProjectionsResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Projection] = []
}

struct Projection {
    var date: String = ""
    var deliveries: [Delivery] = []
    var projections: [SingleProjection] = []
}

struct Delivery {
    var runAt: String = ""
    var purchaserScheduleId: String = ""
}

struct SingleProjection {
    var orderId: String = ""
    var supplierId: String = ""
    var timeZone: String = ""
    var purchaserId: String = ""
    var scheduleId: String = ""
    var purchaserScheduleId: String = ""
    var scheduleName: String = ""
    var type: String = ""
    var number: String = ""
    var productCount: Int = 0
    var total: Float = 0
    var cutoff: String = ""
    var runAt: String = ""
    var placedById: String = ""
    var placedByName: String = ""
    var updatedById: String = ""
    var updatedByName: String = ""
    var cancelledByName: String = ""
    var cancelledAt: String = ""
    var deliveryAt: String = ""
    var completeAt: String = ""
    var retailerEditable: Bool = false
    var runStatus: String = ""
    var sequence: Float = 0
    var state: String = ""
    var label: String = ""
    var isCancellable: Bool = false
    var isCancelled: Bool = false
    var isEditable: Bool = false
    var isReinstatable: Bool = false
    var isLocked: Bool = false
    var color: String = ""
}

extension ProjectionsResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Projection].self, forKey: .data) ?? []
    }
}

extension Projection: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        deliveries = try container.decodeIfPresent([Delivery].self, forKey: .deliveries) ?? []
        projections = try container.decodeIfPresent([SingleProjection].self, forKey: .projections) ?? []
    }
}

extension Delivery: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        runAt = try container.decodeIfPresent(String.self, forKey: .runAt) ?? ""
        purchaserScheduleId = try container.decodeIfPresent(String.self, forKey: .purchaserScheduleId) ?? ""
    }
}

extension SingleProjection: Decodable {
    init(from decoder: Decoder) throws {
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
        total = try container.decodeIfPresent(Float.self, forKey: .total) ?? 0
        cutoff = try container.decodeIfPresent(String.self, forKey: .cutoff) ?? ""
        runAt = try container.decodeIfPresent(String.self, forKey: .runAt) ?? ""
        placedById = try container.decodeIfPresent(String.self, forKey: .placedById) ?? ""
        placedByName = try container.decodeIfPresent(String.self, forKey: .placedByName) ?? ""
        updatedById = try container.decodeIfPresent(String.self, forKey: .updatedById) ?? ""
        updatedByName = try container.decodeIfPresent(String.self, forKey: .updatedByName) ?? ""
        cancelledByName = try container.decodeIfPresent(String.self, forKey: .cancelledByName) ?? ""
        cancelledAt = try container.decodeIfPresent(String.self, forKey: .cancelledAt) ?? ""
        deliveryAt = try container.decodeIfPresent(String.self, forKey: .deliveryAt) ?? ""
        isEditable = try container.decodeIfPresent(Bool.self, forKey: .isEditable) ?? false
        completeAt = try container.decodeIfPresent(String.self, forKey: .completeAt) ?? ""
        retailerEditable = try container.decodeIfPresent(Bool.self, forKey: .retailerEditable) ?? false
        runStatus = try container.decodeIfPresent(String.self, forKey: .runStatus) ?? ""
        sequence = try container.decodeIfPresent(Float.self, forKey: .sequence) ?? 0
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        label = try container.decodeIfPresent(String.self, forKey: .label) ?? ""
        isReinstatable = try container.decodeIfPresent(Bool.self, forKey: .isReinstatable) ?? false
        isCancelled = try container.decodeIfPresent(Bool.self, forKey: .isCancelled) ?? false
        isCancellable = try container.decodeIfPresent(Bool.self, forKey: .isCancellable) ?? false
        isLocked = try container.decodeIfPresent(Bool.self, forKey: .isLocked) ?? false
        color = try container.decodeIfPresent(String.self, forKey: .color) ?? ""
    }
}

extension SingleProjection: Equatable {
    static func == (lhs: SingleProjection, rhs: SingleProjection) -> Bool {
        return lhs.orderId == rhs.orderId
    }
    
    func displayOrderName() -> String {
        //Check Order Name
        if !scheduleName.isEmpty {
            return scheduleName
        }
        
        //Check Order Number
        return number
    }
}

extension SingleProjection {
    var isStandingOrder: Bool {
        return !self.scheduleId.isEmpty
    }
    
    var updateButtonString: String {
        if self.isStandingOrder {
            return "Update Standing Order"
        } else {
            return "Update Order"
        }
    }
}
