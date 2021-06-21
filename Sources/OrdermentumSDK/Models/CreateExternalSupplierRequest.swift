//
//  CreateExternalSupplierRequest.swift
//
//
//  Created by Brandon Stillitano on 21/6/21.
//

import Foundation

public struct CreateExternalSupplierRequest: Codable {
    public init() { }

    public var retailerId: String = ""
    public var name: String = ""
}
