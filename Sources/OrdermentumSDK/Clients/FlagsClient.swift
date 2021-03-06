//
//  FlagsClient.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 13/6/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class FlagsClient {
    //Data
    public var baseURL: String = ""
    public var token: String = ""
    public var headers: [String: String] = [:]
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = FlagsClient()
    
    //Services
    public var experiments: ExperimentsService = ExperimentsService()
    public var flags: FlagsService = FlagsService()
    
    // MARK: Convenience Methods
    public func getHeaderToken() -> String {
        return String(format: "Bearer \(token)")
    }
    
    public func urlRequest(path: String, method: HTTPMethod, parameters: Parameters, body: Codable?) throws ->  URLRequest {
        //Setup Data
        let url = try baseURL.asURL()
        let timeoutSeconds: Int = 10
        
        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        
        //Set Headers
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        //Set Token
        if !token.isEmpty {
            request.setValue(getHeaderToken(), forHTTPHeaderField: "Authorization")
        }
        
        //Set Conditional Body
        switch method {
        case .get:
            return try URLEncoding.default.encode(request, with: parameters)
        default:
            return try JSONEncoding.default.encode(request, with: body?.toParameters())
        }
    }
}

public enum FlagsClientURL {
    public static let rootFlagsURL = "https://flags.ordermentum.com/"
    public static let rootFlagsWebURL = "https://flags.ordermentum.com/"
    public static let rootFlagsTestingURL = "https://flags.ordermentum-sandbox.com/"
    public static let rootFlagsTestingWebURL = "https://flags.ordermentum-sandbox.com/"
}
