//
//  BoolUtils.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 10/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

extension Bool {
    func toString() -> String {
        switch self {
        case true:
            return "true"
        case false:
            return "false"
        default:
            return "false"
        }
    }
}
