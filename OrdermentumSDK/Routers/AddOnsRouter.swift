//
//  AddOnsRouter.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public enum AddOnsRouter: URLRequestConvertible {
    //Routes
    case searchAddons(String, String)
    case discoverAddons(String, String)
    case readAddon(String, String)
    case updateAddon(String, String, AddOnUpdateObject)
    case disconnectAddon(String, String, AddOnDisconnectObject)
    
    //Methods
    var method: HTTPMethod {
        switch self {
        case .searchAddons:
            return .get
        case .discoverAddons:
            return .get
        case .readAddon:
            return .get
        case .updateAddon:
            return .put
        case .disconnectAddon:
            return .put
        }
    }
    
    //Paths
    var path: String {
        switch self {
        case .searchAddons:
            return "addons"
        case .discoverAddons:
            return "addons/discover"
        case .readAddon(let addonId, _):
            return "addons/\(addonId)"
        case .updateAddon(let addonId, let accountId, _):
            return "addons/\(addonId)/account-id/\(accountId)"
        case .disconnectAddon(let addonId, let accountId, _):
            return "addons/\(addonId)/account-id/\(accountId)/disconnect"
        }
    }
    
    //Parameters
    var parameters: [String: Any] {
        switch self {
        case .searchAddons(let entityType, let entityId):
            return ["entityType": entityType, "entityId": entityId]
        case .discoverAddons(let entityType, let entityId):
            return ["entityType": entityType, "entityId": entityId]
        case .readAddon(_, let accountId):
            return ["accountId": accountId]
        default:
            return [:]
        }
    }
    
    //Body
    var body: Codable? {
        switch self {
        case .updateAddon(_, _, let requestObject):
            return requestObject
        case .disconnectAddon(_, _, let requestObject):
            return requestObject
        default:
            return nil
        }
    }
    
    //Builder
    public func asURLRequest() throws -> URLRequest {
        return try Client.instance.urlRequest(path: path, method: method, parameters: parameters, body: body)
    }
}
