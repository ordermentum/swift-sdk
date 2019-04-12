//
//  NPS.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct NPSFeedback: Codable {
    var score: Int = 0
    var comment: String = ""
}

struct NPSResponse {
    var id: String = ""
    var email: String = ""
    var survey_scheduled_at: String = ""
    var name: String = ""
    var show: Bool = false
}

extension NPSResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        survey_scheduled_at = try container.decodeIfPresent(String.self, forKey: .survey_scheduled_at) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        show = try container.decodeIfPresent(Bool.self, forKey: .show) ?? false
    }
}
