//
//  PlatformHeaders.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 15/1/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation

public struct PlatformHeaders: Encodable {
    public init() {}
    
    public var operatingSystem: String = ""
    public var deviceModel: String = ""
    public var deviceType: String = ""
    public var appVersion: String = ""
    public var sessionId: String = ""
}
