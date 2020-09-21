//
//  MergeStatus.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 21/9/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct MergeStatus: Codable {
    public init() { }
    
    public var complete: Int = 0
    public var total: Int = 0
}
