//
//  AuthClient.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 29/6/20.
//  Copyright © 2020 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class AuthClient {
    //Data
    public var baseURL: String = ""
    public var token: String = ""
    public var headers: [String: String] = [:]
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = AuthClient()
    
    //Services
    public var social: SocialService = SocialService()
    
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

public enum AuthClientURL {
    public static let rootAuthURL = "https://auth.ordermentum.com/v1/"
    public static let rootAuthSandboxURL = "https://auth.ordermentum-sandbox.com/v1/"
}
