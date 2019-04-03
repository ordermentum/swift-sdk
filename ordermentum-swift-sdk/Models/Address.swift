//
//  Address.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Address: Codable {
    var number: String = ""
    var description: String = ""
    var street1: String = ""
    var street2: String = ""
    var suburb: String = ""
    var state: String = ""
    var postcode: String = ""
    var country: String = ""
}
