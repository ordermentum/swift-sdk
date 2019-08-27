//
//  Experiments.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct ExperimentsResponse {
    public var data: [ExperimentsData] = []
}

public struct ExperimentsData {
    public var id: String = ""
    public var name: String = ""
    public var meta: [String: String] = [:]
    
    public init() {}
}

public struct ExperimentsDismissRequest: Encodable {
    public init() {}
    
    public var userId: String = ""
    public var experimentId: String = ""
}

extension ExperimentsResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        data = try container.decodeIfPresent([ExperimentsData].self, forKey: .data) ?? []
    }
}

extension ExperimentsData: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        meta = try container.decodeIfPresent([String: String].self, forKey: .meta) ?? [:]
    }
}

extension ExperimentsDismissRequest: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        experimentId = try container.decodeIfPresent(String.self, forKey: .experimentId) ?? ""
    }
}

extension ExperimentsData: Equatable {
    public static func == (lhs: ExperimentsData, rhs: ExperimentsData) -> Bool {
        return lhs.id == rhs.id
    }
}

extension ExperimentsData: AnalyticsTrackable {
    public var trackableProperties: [String: String]? {
        var trackableProperties: [String: String] = [:]
        trackableProperties["id"] = id
        trackableProperties["name"] = name
        return trackableProperties
    }
}
