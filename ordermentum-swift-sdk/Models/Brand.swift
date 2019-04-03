//
//  Brand.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct Brand {
    var logo: Image = Image()
    var images: [Image] = []
}

extension Brand: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        logo = try container.decodeIfPresent(Image.self, forKey: .logo) ?? Image()
        images = try container.decodeIfPresent([Image].self, forKey: .images) ?? []
    }
}
