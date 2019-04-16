//
//  FindSupplier.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct FindSupplierResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [FindSupplierData] = []
}

public struct FindSupplierRequest: Codable {
    public var retailerId: String = ""
    public var supplierId: String = ""
    public var message: String = ""
    public var source: String = ""
    public var existing: Bool = false
    public var recommended: Bool = false
}

public struct FindSupplierReferralRequest: Codable {
    public var email: String = ""
    public var retailerId: String = ""
    public var name: String = ""
    public var phone: String = ""
    public var userId: String = ""
    public var message: String = ""
    public var source: String = ""
}

public struct FindSupplierData {
    public var id: String = ""
    public var logo: Image = Image()
    public var name: String = ""
    public var address: Address = Address()
    public var phone: String = ""
}

extension FindSupplierResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([FindSupplierData].self, forKey: .data) ?? []
    }
}

extension FindSupplierData: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        address = try container.decodeIfPresent(Address.self, forKey: .address) ?? Address()
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
    }
}
