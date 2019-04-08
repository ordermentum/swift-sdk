//
//  Notify.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct NotifyBody: Codable {
    var userId: String = ""
    var deviceId: String = ""
    var deviceToken: String = ""
    var deviceType: String = ""
}
