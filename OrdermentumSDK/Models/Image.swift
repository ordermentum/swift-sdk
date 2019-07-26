//
//  Image.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Image: Encodable {
    public init() {}
    
    public var secure_url: String = ""
    public var original: String = ""
    public var logo: String = ""
    public var icon: String = ""
    public var print: String = ""
    public var mini: String = ""
    public var small: String = ""
    public var medium: String = ""
    public var large: String = ""
}

extension Image: Decodable {
    public init(from decoder: Decoder) throws {
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
