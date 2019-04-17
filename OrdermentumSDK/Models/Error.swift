//
//  Error.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 19/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct ErrorResponse {
    public var message: String = ""
    public var name: String = ""
    public var code: Int = 0
}

extension ErrorResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        } catch {
            message = ""
        }
        
        do {
            name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        } catch {
            name = ""
        }
        
        do {
            code = try container.decodeIfPresent(Int.self, forKey: .code) ?? -1
        } catch {
            code = -1
        }
    }
}
