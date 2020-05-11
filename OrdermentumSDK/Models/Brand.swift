//
//  Brand.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Brand: Encodable {
    public var logo: Image = Image()
    public var images: [Image] = []
}

extension Brand: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        images = try container.decodeIfPresent([Image].self, forKey: .images) ?? []
    }
}
