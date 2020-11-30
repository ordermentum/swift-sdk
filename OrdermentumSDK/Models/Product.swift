//
//  Product.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

// Request body object for fetching products
public struct ProductSearchRequest: Codable {
    
    //Init for a search request
    public init(searchTerm: String) {
        self.search = searchTerm
    }
    
    //Init for a fetch request
    public init(categoryId: String) {
        self.categoryId = categoryId
    }
    
    public var supplierId: String = ""
    public var search: String?
    public var categoryId: String?
    
    public var pageNo: Int = 1
    public var pageSize: Int = 25
    public var visible: Bool = true
}

public struct ProductResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Product] = []
}

public struct Product: Encodable {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
    public var price: String = ""
    public var formattedPrice: String = ""
    public var SKU: String = ""
    public var categories: [Category] = []
    public var weight: Float = 0
    public var display: Display = Display()
    public var displayUOM: String = ""
    public var uom: String = ""
    public var unit: String = ""
    public var unitSize: Int = 0
    public var minQuantity: Int = 0
    public var randomWeight: Bool = false
    public var productCategories: [Category] = []
    public var description: String = ""
    public var supplierId: String = ""
    public var images: Image = Image()
    public var sortOrder: Int = 0
    public var addTax: Bool = false
    public var visible: Bool = false
    public var batchCode: String = ""
    public var leadTime: Float = 0
    public var deliveryDays: [String] = []
    public var outOfStock: Bool = false
    public var poa: Bool = false
    public var paymentOptions: [PaymentOption] = []
}

public struct Display: Encodable {
    public var displayUOM: String = ""
    public var price: String = ""
    public var unitPrice: String = ""
    public var uom: String = ""
}

extension ProductResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Product].self, forKey: .data) ?? []
    }
}

extension Product: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        price = try container.safeStringFloatDecode(forKey: .price) ?? ""
        formattedPrice = try container.decodeIfPresent(String.self, forKey: .formattedPrice) ?? ""
        SKU = try container.decodeIfPresent(String.self, forKey: .SKU) ?? ""
        categories = try container.decodeIfPresent([Category].self, forKey: .categories) ?? []
        weight = try container.safeFloatDecode(forKey: .weight) ?? 0
        display = try container.decodeIfPresent(Display.self, forKey: .display) ?? Display()
        displayUOM = try container.decodeIfPresent(String.self, forKey: .displayUOM) ?? ""
        uom = try container.decodeIfPresent(String.self, forKey: .uom) ?? ""
        unit = try container.decodeIfPresent(String.self, forKey: .unit) ?? ""
        unitSize = try container.safeIntDecode(forKey: .unitSize) ?? 0
        minQuantity = try container.safeIntDecode(forKey: .minQuantity) ?? 0
        randomWeight = try container.safeBoolDecode(forKey: .randomWeight) ?? false
        productCategories = try container.decodeIfPresent([Category].self, forKey: .productCategories) ?? []
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        images = try container.decodeIfPresent(Image.self, forKey: .images) ?? Image()
        sortOrder = try container.safeIntDecode(forKey: .sortOrder) ?? 0
        addTax = try container.safeBoolDecode(forKey: .addTax) ?? false
        visible = try container.safeBoolDecode(forKey: .visible) ?? false
        batchCode = try container.decodeIfPresent(String.self, forKey: .batchCode) ?? ""
        leadTime = try container.safeFloatDecode(forKey: .leadTime) ?? 0
        deliveryDays = try container.decodeIfPresent([String].self, forKey: .deliveryDays) ?? []
        outOfStock = try container.safeBoolDecode(forKey: .outOfStock) ?? false
        poa = try container.safeBoolDecode(forKey: .poa) ?? false
        paymentOptions = try container.decodeIfPresent([PaymentOption].self, forKey: .paymentOptions) ?? []
    }
}

extension Display: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        displayUOM = try container.decodeIfPresent(String.self, forKey: .displayUOM) ?? ""
        price = try container.decodeIfPresent(String.self, forKey: .price) ?? ""
        unitPrice = try container.decodeIfPresent(String.self, forKey: .unitPrice) ?? ""
        uom = try container.decodeIfPresent(String.self, forKey: .uom) ?? ""
    }
}

extension Product: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        return ["productName": self.name,
                "productId": self.id]
    }
}
