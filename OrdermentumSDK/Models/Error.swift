//
//  Error.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 19/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct ErrorResponse {
    var message: String = ""
    var name: String = ""
    var code: Int = 0
}

extension ErrorResponse: Decodable {
    init(from decoder: Decoder) throws {
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
