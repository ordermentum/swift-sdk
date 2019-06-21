//
//  Category.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct CategoryResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Category] = []
}

public struct Category: Encodable {
    public init() {}
    public var id: String = ""
    public var name: String = ""
    public var description: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var images: Image = Image()
    public var sortOrder: Int = 0
}

extension CategoryResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Category].self, forKey: .data) ?? []
    }
}

extension Category: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        images = try container.decodeIfPresent(Image.self, forKey: .images) ?? Image()
        sortOrder = try container.safeIntDecode(forKey: .sortOrder) ?? 0
    }
}

extension Category: Equatable {
    public static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Category: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        return ["name": name]
    }
}
