//
//  MergeVenuesRequest.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 22/10/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct MergeVenuesRequest: Codable {
    public init() { }
    
    public var retailerId: String = ""
    public var retailerIds: [String] = []
    public var mergeTradingHistory: Bool = false
    public var purchaserIds: [String] = []
}
