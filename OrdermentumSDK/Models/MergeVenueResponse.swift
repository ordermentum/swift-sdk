//
//  MergeVenueResponse.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 22/10/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct MergeVenueResponse {
    public var queued: Bool = false
    public var eventId: String = ""
}

extension MergeVenueResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        queued = try container.decodeIfPresent(Bool.self, forKey: .queued) ?? false
        eventId = try container.decodeIfPresent(String.self, forKey: .eventId) ?? ""
    }
}
