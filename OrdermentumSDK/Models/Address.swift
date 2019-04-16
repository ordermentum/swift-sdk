//
//  Address.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Address: Codable {
    public var number: String = ""
    public var description: String = ""
    public var street1: String = ""
    public var street2: String = ""
    public var suburb: String = ""
    public var state: String = ""
    public var postcode: String = ""
    public var country: String = ""
}
