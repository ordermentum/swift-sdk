//
//  Meta.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 10/7/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct Meta {
    public var totalResults: Int = 0
    public var totalPages: Int = 0
    public var pageSize: Int = 0
    public var pageNo: Int = 0
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
