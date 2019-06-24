//
//  AddOns.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct AddOnsResponse {
    public var data: [AddOn] = []
}

public struct AddOn {
    public init() {}
    
    public var connectUrl: String = ""
    public var disconnectUrl: String = ""
    public var entityName: String = ""
    public var entityType: String = ""
    public var id: String = ""
    public var integrationData: IntegrationData = IntegrationData()
    public var logo: String = ""
    public var name: String = ""
    public var plan: String = ""
    public var readUrl: String = ""
    public var type: String = ""
    public var updateUrl: String = ""
}

public struct IntegrationData {
    public init() {}
    
    public var accountId: String = ""
    public var expenseAccountCode: String = ""
    public var lastInvoiceSyncedAt: String = ""
    public var supplierName: String = ""
}

public struct AddOnsDiscoverResponse {
    public var data: [AddOnsDiscover] = []
}

public struct AddOnsDiscover {
    public var description: String = ""
    public var links: AddOnsDiscoverLinks = AddOnsDiscoverLinks()
    public var logo: String = ""
    public var name: String = ""
    public var plan: String = ""
    public var slug: String = ""
    public var subtext: String = ""
    public var type: String = ""
}

public struct AddOnsDiscoverLinks {
    public init() {}
    
    public var connect: String = ""
}

public struct AddOnUpdateObject: Codable {
    public init() {}
    
    public var accountId: String = ""
    public var expenseAccountCode: String = ""
}

public struct AddOnDisconnectObject: Codable {
    public init() {}
    
    public var accountId: String = ""
}

extension AddOn: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent([AddOnsDiscover].self, forKey: .data) ?? []
    }
}

extension AddOnsDiscover: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        connect = try container.decodeIfPresent(String.self, forKey: .connect) ?? ""
    }
}
