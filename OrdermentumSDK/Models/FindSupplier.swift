//
//  FindSupplier.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct FindSupplierResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [RecommendedSupplier] = []
}

public struct FindSupplierRequest: Codable {
    public init() {}
    
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var message: String = ""
    public var source: String = ""
    public var existing: Bool = false
    public var recommended: Bool = false
    public var isTrading: Bool = false
    public var isFromLink: Bool = false
}

public struct FindSupplierReferralRequest: Codable {
    public init() {}
    
    public var email: String = ""
    public var retailerId: String = ""
    public var name: String = ""
    public var phone: String = ""
    public var userId: String = ""
    public var message: String = ""
    public var source: String = ""
}

extension FindSupplierResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([RecommendedSupplier].self, forKey: .data) ?? []
    }
}
