//
//  Product.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct ProductResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Product] = []
}

public struct Product: Encodable {
    var id: String = ""
    var name: String = ""
    var price: String = ""
    var formattedPrice: String = ""
    var SKU: String = ""
    var categories: [Category] = []
    var weight: Float = 0
    var display: Display = Display()
    var displayUOM: String = ""
    var uom: String = ""
    var unit: String = ""
    var unitSize: Int = 0
    var minQuantity: Int = 0
    var randomWeight: Bool = false
    var productCategories: [Category] = []
    var description: String = ""
    var supplierId: String = ""
    var images: Image = Image()
    var sortOrder: Int = 0
    var addTax: Bool = false
    var visible: Bool = false
    var batchCode: String = ""
    var leadTime: Int = 0
    var deliveryDays: [String] = []
}

public struct Display: Encodable {
    var displayUOM: String = ""
    var price: String = ""
    var unitPrice: String = ""
    var uom: String = ""
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
        randomWeight = try container.decodeIfPresent(Bool.self, forKey: .randomWeight) ?? false
        productCategories = try container.decodeIfPresent([Category].self, forKey: .productCategories) ?? []
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        images = try container.decodeIfPresent(Image.self, forKey: .images) ?? Image()
        sortOrder = try container.safeIntDecode(forKey: .sortOrder) ?? 0
        addTax = try container.decodeIfPresent(Bool.self, forKey: .addTax) ?? false
        visible = try container.decodeIfPresent(Bool.self, forKey: .visible) ?? false
        batchCode = try container.decodeIfPresent(String.self, forKey: .batchCode) ?? ""
        leadTime = try container.safeIntDecode(forKey: .leadTime) ?? 0
        deliveryDays = try container.decodeIfPresent([String].self, forKey: .deliveryDays) ?? []
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
