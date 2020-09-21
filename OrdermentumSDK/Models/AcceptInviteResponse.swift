//
//  AcceptInviteResponse.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 21/9/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct AcceptInviteResponse {
    public var mergeEventId: String = ""
}

extension AcceptInviteResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mergeEventId = try container.decodeIfPresent(String.self, forKey: .mergeEventId) ?? ""
    }
}
