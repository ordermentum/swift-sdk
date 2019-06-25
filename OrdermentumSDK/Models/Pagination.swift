//
//  Pagination.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Meta {
    public var totalResults: Int = 0
    public var totalPages: Int = 0
    public var pageSize: Int = 0
    public var pageNo: Int = 0
}

public struct Links {
    public var linksSelf: String = ""
    public var first: String = ""
    public var prev: String = ""
    public var next: String = ""
    public var last: String = ""
}

extension Meta: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        totalResults = try container.safeIntDecode(forKey: .totalResults) ?? 0
        totalPages = try container.safeIntDecode(forKey: .totalPages) ?? 0
        pageSize = try container.safeIntDecode(forKey: .pageSize) ?? 0
        pageNo = try container.safeIntDecode(forKey: .pageNo) ?? 0
    }
}

extension Links: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        linksSelf = try container.decodeIfPresent(String.self, forKey: .linksSelf) ?? ""
        first = try container.decodeIfPresent(String.self, forKey: .first) ?? ""
        prev = try container.decodeIfPresent(String.self, forKey: .prev) ?? ""
        next = try container.decodeIfPresent(String.self, forKey: .next) ?? ""
        last = try container.decodeIfPresent(String.self, forKey: .last) ?? ""
    }
}
