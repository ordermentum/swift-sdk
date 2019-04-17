//
//  Notify.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct NotifyBody: Codable {
    public init() {}
    
    public var userId: String = ""
    public var deviceId: String = ""
    public var deviceToken: String = ""
    public var deviceType: String = ""
}
