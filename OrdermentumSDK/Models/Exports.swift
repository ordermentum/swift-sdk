//
//  Exports.swift
//  OrdermentumSDK
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
        retailersCsv = try container.safeBoolDecode(forKey: .retailersCsv) ?? false
        retailersUsers = try container.safeBoolDecode(forKey: .retailersUsers) ?? false
    }
}

extension OrderExports: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        ordersCsv = try container.safeBoolDecode(forKey: .ordersCsv) ?? false
        attacheXml = try container.safeBoolDecode(forKey: .attacheXml) ?? false
        reckonReport = try container.safeBoolDecode(forKey: .reckonReport) ?? false
        globalBakeXml = try container.safeBoolDecode(forKey: .globalBakeXml) ?? false
        ordersPickPdf = try container.safeBoolDecode(forKey: .ordersPickPdf) ?? false
        ordersInvoicePdf = try container.safeBoolDecode(forKey: .ordersInvoicePdf) ?? false
        ordersDeliveryPdf = try container.safeBoolDecode(forKey: .ordersDeliveryPdf) ?? false
        ordersLineItemsCsv = try container.safeBoolDecode(forKey: .ordersLineItemsCsv) ?? false
        ordersProductionCsv = try container.safeBoolDecode(forKey: .ordersProductionCsv) ?? false
        ordersDeliverySummaryPdf = try container.safeBoolDecode(forKey: .ordersDeliverySummaryPdf) ?? false
        ordersDeliveryManifestPdf = try container.safeBoolDecode(forKey: .ordersDeliveryManifestPdf) ?? false
        ordersLineItemsDetailsCsv = try container.safeBoolDecode(forKey: .ordersLineItemsDetailsCsv) ?? false
        ordersProductionReportPdf = try container.safeBoolDecode(forKey: .ordersProductionReportPdf) ?? false
    }
}

extension ProductExports: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        productsCsv = try container.safeBoolDecode(forKey: .productsCsv) ?? false
    }
}
