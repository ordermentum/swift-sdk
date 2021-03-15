//
//  MergeStatus.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 21/9/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct MergeStatus {
    public init() { }

    public var complete: Int = 0
    public var total: Int = 0
    public var toRetailer: MergeRetailer = MergeRetailer()
    public var fromRetailers: [MergeRetailer] = []
}

public struct MergeRetailer {
    public init() { }

    public var id: String = ""
    public var name: String = ""
}

extension MergeStatus: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        complete = try container.decodeIfPresent(Int.self, forKey: .complete) ?? 0
        total = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
        toRetailer = try container.decodeIfPresent(MergeRetailer.self, forKey: .toRetailer) ?? MergeRetailer()
        fromRetailers = try container.decodeIfPresent([MergeRetailer].self, forKey: .fromRetailers) ?? []
    }
}

extension MergeRetailer: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .complete) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .total) ?? ""
    }
}
