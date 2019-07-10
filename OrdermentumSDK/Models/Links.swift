//
//  Links.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 10/7/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct Links {
    public var linksSelf: String = ""
    public var first: String = ""
    public var prev: String = ""
    public var next: String = ""
    public var last: String = ""
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
