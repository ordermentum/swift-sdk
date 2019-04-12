//
//  PaginatedAPIResponse.swift
//  Caching
//
//  Created by Ryan Castro on 12/09/2018.
//  Copyright © 2018 Ordermentum. All rights reserved.
//

import Foundation

struct PaginatedAPIResponse<D: Decodable>: Decodable {
    var meta: PaginatedAPIMeta?
    var links: PaginatedAPILink?
    var data: [D]?
}

struct PaginatedAPIMeta: Decodable {
    var totalResults: Int
    var totalPages: Int
    var pageSize: Int
    var pageNo: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PaginatedAPIMetaCodingKeys.self)
        totalResults = try container.safeIntDecode(forKey: .totalResults) ?? 0
        totalPages = try container.safeIntDecode(forKey: .totalPages) ?? 0
        pageSize = try container.safeIntDecode(forKey: .pageSize) ?? 0
        pageNo = try container.safeIntDecode(forKey: .pageNo) ?? 0
    }

    enum PaginatedAPIMetaCodingKeys: String, CodingKey {
        case totalResults
        case totalPages
        case pageSize
        case pageNo
    }

}

struct PaginatedAPILink: Decodable {
    var linksSelf: String?
    var first: String?
    var prev: String?
    var next: String?
    var last: String?
}
