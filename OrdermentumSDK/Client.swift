//
//  Client.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class Client {
    //Data
    var baseURL: String = ""
    var token: String = ""
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = Client()
    
    // MARK: Convenience Methods
    public func setProductionURL() {
        baseURL = ClientURL.rootURL
    }
    
    public func setTestingURL() {
        baseURL = ClientURL.rootTestingURL
    }
    
    public func setCustomURL(urlString: String) {
        baseURL = urlString
    }
    
    public func setToken(tokenString: String) {
        token = tokenString
    }
    
    public func getHeaderToken() -> String {
        print(String(format: "Bearer \(token)"))
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

public enum ClientURL {
    public static let rootURL = "https://app.ordermentum.com/v1/"
    public static let rootWebURL = "https://app.ordermentum.com/"
    public static let rootTestingURL = "https://app-testing.ordermentum.com/v1/"
    public static let rootTestingWebURL = "https://app-testing.ordermentum.com/"
}
