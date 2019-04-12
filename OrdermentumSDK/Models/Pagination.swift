//
//  Pagination.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Meta {
    var totalResults: Int = 0
    var totalPages: Int = 0
    var pageSize: Int = 0
    var pageNo: Int = 0
}

struct Links {
    var linksSelf: String = ""
    var first: String = ""
    var prev: String = ""
    var next: String = ""
    var last: String = ""
}

extension Meta: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages) ?? 0
        pageSize = try container.decodeIfPresent(Int.self, forKey: .pageSize) ?? 0
        pageNo = try container.decodeIfPresent(Int.self, forKey: .pageNo) ?? 0
    }
}

extension Links: Decodable {
    init(from decoder: Decoder) throws {
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
