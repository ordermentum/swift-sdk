//
//  Insights.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct Insights: Encodable {
    var trending: Bool = false
    var mostOrdered: Bool = false
}

extension Insights: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Trending
        do {
            trending = try container.decodeIfPresent(Bool.self, forKey: .trending) ?? false
        } catch {
            let stringBool = try container.decodeIfPresent(String.self, forKey: .trending) ?? "false"
            trending = stringBool.toBool()
        }
        
        //Most Ordered
        do {
            mostOrdered = try container.decodeIfPresent(Bool.self, forKey: .mostOrdered) ?? false
        } catch {
            let stringBool = try container.decodeIfPresent(String.self, forKey: .mostOrdered) ?? "false"
            mostOrdered = stringBool.toBool()
        }
    }
}
