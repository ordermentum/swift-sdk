//
//  Device.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct Device: Codable {
    public init() {}
    
    public var user_id: String = ""
    public var primary_device_id: String = ""
    public var secondary_device_id: String = ""
    public var device_type: String = ""
    public var device_os_version: String = ""
    public var device_hw_version: String = ""
}
