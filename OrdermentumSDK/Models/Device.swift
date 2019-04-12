//
//  Device.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 5/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct Device: Codable {
    var user_id: String = ""
    var primary_device_id: String = ""
    var secondary_device_id: String = ""
    var device_type: String = ""
    var device_os_version: String = ""
    var device_hw_version: String = ""
}
