//
//  FindSupplier.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct FindSupplierResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [FindSupplierData] = []
}

struct FindSupplierRequest: Codable {
    var retailerId: String = ""
    var supplierId: String = ""
    var message: String = ""
    var source: String = ""
    var isTrading: Bool = false
}

struct FindSupplierReferralRequest {
    var email: String = ""
    var retailerId: String = ""
    var name: String = ""
    var phone: String = ""
    var userId: String = ""
    var message: String = ""
    var source: String = ""
}

struct FindSupplierData {
    var id: String = ""
    var logo: Image = Image()
    var name: String = ""
    var address: Address = Address()
    var phone: String = ""
}

extension FindSupplierResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([FindSupplierData].self, forKey: .data) ?? []
    }
}

extension FindSupplierData: Decodable {
    init(from decoder: Decoder) throws {
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
