//
//  ExternalSuppliersResponse.swift
//
//
//  Created by Brandon Stillitano on 21/6/21.
//

import Foundation

public struct ExternalSuppliersResponse {
    public init() { }

    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [ExternalSupplier] = []
}

extension ExternalSuppliersResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)

        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([ExternalSupplier].self, forKey: .data) ?? []
    }
}
