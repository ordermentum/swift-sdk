//
//  AnalyticsTrackable.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 30/05/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public protocol AnalyticsTrackable {
    var trackableProperties: [String: String]? { get }
}
