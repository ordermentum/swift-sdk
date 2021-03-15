//
//  Impersonate.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 19/11/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct ImpersonateResponse {
    public init() {}
    
    public var success: Bool = false
    public var url: String = ""
}

extension ImpersonateResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        success = try container.decodeIfPresent(Bool.self, forKey: .success) ?? false
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
