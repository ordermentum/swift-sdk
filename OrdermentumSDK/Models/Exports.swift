//
//  Exports.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct RetailerExports: Encodable {
    public init() {}
    
    public var retailersCsv: Bool = false
    public var retailersUsers: Bool = false
}

public struct OrderExports: Encodable {
    public init() {}
    
    public var ordersCsv: Bool = false
    public var attacheXml: Bool = false
    public var reckonReport: Bool = false
    public var globalBakeXml: Bool = false
    public var ordersPickPdf: Bool = false
    public var ordersInvoicePdf: Bool = false
    public var ordersDeliveryPdf: Bool = false
    public var ordersLineItemsCsv: Bool = false
    public var ordersProductionCsv: Bool = false
    public var ordersDeliverySummaryPdf: Bool = false
    public var ordersDeliveryManifestPdf: Bool = false
    public var ordersLineItemsDetailsCsv: Bool = false
    public var ordersProductionReportPdf: Bool = false
}

public struct ProductExports: Encodable {
    public init() {}
    
    public var productsCsv: Bool = false
}

extension RetailerExports: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        retailersCsv = try container.decodeIfPresent(Bool.self, forKey: .retailersCsv) ?? false
        retailersUsers = try container.decodeIfPresent(Bool.self, forKey: .retailersUsers) ?? false
    }
}

extension OrderExports: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        ordersCsv = try container.decodeIfPresent(Bool.self, forKey: .ordersCsv) ?? false
        attacheXml = try container.decodeIfPresent(Bool.self, forKey: .attacheXml) ?? false
        reckonReport = try container.decodeIfPresent(Bool.self, forKey: .reckonReport) ?? false
        globalBakeXml = try container.decodeIfPresent(Bool.self, forKey: .globalBakeXml) ?? false
        ordersPickPdf = try container.decodeIfPresent(Bool.self, forKey: .ordersPickPdf) ?? false
        ordersInvoicePdf = try container.decodeIfPresent(Bool.self, forKey: .ordersInvoicePdf) ?? false
        ordersDeliveryPdf = try container.decodeIfPresent(Bool.self, forKey: .ordersDeliveryPdf) ?? false
        ordersLineItemsCsv = try container.decodeIfPresent(Bool.self, forKey: .ordersLineItemsCsv) ?? false
        ordersProductionCsv = try container.decodeIfPresent(Bool.self, forKey: .ordersProductionCsv) ?? false
        ordersDeliverySummaryPdf = try container.decodeIfPresent(Bool.self, forKey: .ordersDeliverySummaryPdf) ?? false
        ordersDeliveryManifestPdf = try container.decodeIfPresent(Bool.self, forKey: .ordersDeliveryManifestPdf) ?? false
        ordersLineItemsDetailsCsv = try container.decodeIfPresent(Bool.self, forKey: .ordersLineItemsDetailsCsv) ?? false
        ordersProductionReportPdf = try container.decodeIfPresent(Bool.self, forKey: .ordersProductionReportPdf) ?? false
    }
}

extension ProductExports: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        productsCsv = try container.decodeIfPresent(Bool.self, forKey: .productsCsv) ?? false
    }
}
