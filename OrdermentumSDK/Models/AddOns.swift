//
//  AddOns.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct AddOnsResponse {
    var data: [AddOn] = []
}

struct AddOn {
    var connectUrl: String = ""
    var disconnectUrl: String = ""
    var entityName: String = ""
    var entityType: String = ""
    var id: String = ""
    var integrationData: IntegrationData = IntegrationData()
    var logo: String = ""
    var name: String = ""
    var plan: String = ""
    var readUrl: String = ""
    var type: String = ""
    var updateUrl: String = ""
}

struct IntegrationData {
    var accountId: String = ""
    var expenseAccountCode: String = ""
    var lastInvoiceSyncedAt: String = ""
    var supplierName: String = ""
}

struct AddOnsDiscoverResponse {
    var data: [AddOnsDiscover] = []
}

struct AddOnsDiscover {
    var description: String = ""
    var links: AddOnsDiscoverLinks = AddOnsDiscoverLinks()
    var logo: String = ""
    var name: String = ""
    var plan: String = ""
    var slug: String = ""
    var subtext: String = ""
    var type: String = ""
}

struct AddOnsDiscoverLinks {
    var connect: String = ""
}

public struct AddOnUpdateObject: Codable {
    var accountId: String = ""
    var expenseAccountCode: String = ""
}

public struct AddOnDisconnectObject: Codable {
    var accountId: String = ""
}

extension AddOn: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        connectUrl = try container.decodeIfPresent(String.self, forKey: .connectUrl) ?? ""
        disconnectUrl = try container.decodeIfPresent(String.self, forKey: .disconnectUrl) ?? ""
        entityName = try container.decodeIfPresent(String.self, forKey: .entityName) ?? ""
        entityType = try container.decodeIfPresent(String.self, forKey: .entityType) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        integrationData = try container.decodeIfPresent(IntegrationData.self, forKey: .integrationData) ?? IntegrationData()
        logo = try container.decodeIfPresent(String.self, forKey: .logo) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        plan = try container.decodeIfPresent(String.self, forKey: .plan) ?? ""
        readUrl = try container.decodeIfPresent(String.self, forKey: .readUrl) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        updateUrl = try container.decodeIfPresent(String.self, forKey: .updateUrl) ?? ""
    }
}

extension IntegrationData: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        accountId = try container.decodeIfPresent(String.self, forKey: .accountId) ?? ""
        expenseAccountCode = try container.decodeIfPresent(String.self, forKey: .expenseAccountCode) ?? ""
        lastInvoiceSyncedAt = try container.decodeIfPresent(String.self, forKey: .lastInvoiceSyncedAt) ?? ""
        supplierName = try container.decodeIfPresent(String.self, forKey: .supplierName) ?? ""
    }
}

extension AddOnsDiscoverResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent([AddOnsDiscover].self, forKey: .data) ?? []
    }
}

extension AddOnsDiscover: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        links = try container.decodeIfPresent(AddOnsDiscoverLinks.self, forKey: .links) ?? AddOnsDiscoverLinks()
        logo = try container.decodeIfPresent(String.self, forKey: .logo) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        plan = try container.decodeIfPresent(String.self, forKey: .plan) ?? ""
        slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        subtext = try container.decodeIfPresent(String.self, forKey: .subtext) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}

extension AddOnsDiscoverLinks: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        connect = try container.decodeIfPresent(String.self, forKey: .connect) ?? ""
    }
}
