//
//  Client.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class Client {
    //Data
    var baseURL: String = ""
    var token: String = ""
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    static let instance = Client()
    
    // MARK: Convenience Methods
    func setProductionURL() {
        baseURL = ClientURL.rootURL
    }
    
    func setTestingURL() {
        baseURL = ClientURL.rootTestingURL
    }
    
    func setCustomURL(urlString: String) {
        baseURL = urlString
    }
    
    func setToken(tokenString: String) {
        token = tokenString
    }
    
    func getHeaderToken() -> String {
        return String(format: "Bearer: \(token)")
    }
    
    func urlRequest(path: String, method: HTTPMethod, parameters: Parameters, body: Codable?) throws ->  URLRequest {
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

enum ClientURL {
    static let rootURL = "https://app.ordermentum.com/v1/"
    static let rootWebURL = "https://app.ordermentum.com/"
    static let rootTestingURL = "https://app-testing.ordermentum.com/v1/"
    static let rootTestingWebURL = "https://app-testing.ordermentum.com/"
}
