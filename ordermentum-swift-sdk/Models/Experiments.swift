//
//  Experiments.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct ExperimentsResponse {
    var data: [ExperimentsData] = []
}

struct ExperimentsData {
    var id: String = ""
    var slot: String = ""
    var name: String = ""
    var meta: [String: String] = [:]
}

struct ExperimentsDismissRequest {
    var userId: String = ""
    var experimentId: String = ""
}

extension ExperimentsResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent([ExperimentsData].self, forKey: .data) ?? []
    }
}

extension ExperimentsData: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        slot = try container.decodeIfPresent(String.self, forKey: .slot) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        meta = try container.decodeIfPresent([String: String].self, forKey: .meta) ?? [:]
    }
}

extension ExperimentsDismissRequest: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        userId = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        experimentId = try container.decodeIfPresent(String.self, forKey: .experimentId) ?? ""
    }
}

extension ExperimentsData: Equatable {
    static func == (lhs: ExperimentsData, rhs: ExperimentsData) -> Bool {
        return lhs.id == rhs.id
    }
}
