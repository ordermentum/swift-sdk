//
//  NPS.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct NPSFeedback: Codable {
    public init() {}
    
    public var score: Int = 0
    public var comment: String = ""
}

public struct NPSResponse {
    public var id: String = ""
    public var email: String = ""
    public var survey_scheduled_at: String = ""
    public var name: String = ""
    public var show: Bool = false
}

extension NPSResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        survey_scheduled_at = try container.decodeIfPresent(String.self, forKey: .survey_scheduled_at) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        show = try container.safeBoolDecode(forKey: .show) ?? false
    }
}
