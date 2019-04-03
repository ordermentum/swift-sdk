//
//  Exports.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct RetailerExports: Encodable {
    var retailersCsv: Bool = false
    var retailersUsers: Bool = false
}

struct OrderExports: Encodable {
    var ordersCsv: Bool = false
    var attacheXml: Bool = false
    var reckonReport: Bool = false
    var globalBakeXml: Bool = false
    var ordersPickPdf: Bool = false
    var ordersInvoicePdf: Bool = false
    var ordersDeliveryPdf: Bool = false
    var ordersLineItemsCsv: Bool = false
    var ordersProductionCsv: Bool = false
    var ordersDeliverySummaryPdf: Bool = false
    var ordersDeliveryManifestPdf: Bool = false
    var ordersLineItemsDetailsCsv: Bool = false
    var ordersProductionReportPdf: Bool = false
}

struct ProductExports: Encodable {
    var productsCsv: Bool = false
}

extension RetailerExports: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        retailersCsv = try container.decodeIfPresent(Bool.self, forKey: .retailersCsv) ?? false
        retailersUsers = try container.decodeIfPresent(Bool.self, forKey: .retailersUsers) ?? false
    }
}

extension OrderExports: Decodable {
    init(from decoder: Decoder) throws {
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
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        productsCsv = try container.decodeIfPresent(Bool.self, forKey: .productsCsv) ?? false
    }
}
