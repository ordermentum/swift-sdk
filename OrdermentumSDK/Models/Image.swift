//
//  Image.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Image: Encodable {
    var secure_url: String = ""
    var original: String = ""
    var logo: String = ""
    var icon: String = ""
    var print: String = ""
    var mini: String = ""
    var small: String = ""
    var medium: String = ""
    var large: String = ""
}

extension Image: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        secure_url = try container.decodeIfPresent(String.self, forKey: .secure_url) ?? ""
        original = try container.decodeIfPresent(String.self, forKey: .original) ?? ""
        logo = try container.decodeIfPresent(String.self, forKey: .logo) ?? ""
        icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
        print = try container.decodeIfPresent(String.self, forKey: .print) ?? ""
        mini = try container.decodeIfPresent(String.self, forKey: .mini) ?? ""
        small = try container.decodeIfPresent(String.self, forKey: .small) ?? ""
        medium = try container.decodeIfPresent(String.self, forKey: .medium) ?? ""
        large = try container.decodeIfPresent(String.self, forKey: .large) ?? ""
    }
}
