//
//  StaticClient.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 26/7/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class StaticClient {
    //Data
    public var baseURL: String = StaticClientURL.rootURL
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = StaticClient()
    
    //Services
    public var appVersion: AppVersionService = AppVersionService()
    public var admin: AdminService = AdminService()
    
    public func urlRequest(path: String, method: HTTPMethod, parameters: Parameters, body: Codable?) throws ->  URLRequest {
        //Setup Data
        let url = try baseURL.asURL()
        let timeoutSeconds: Int = 10
        
        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        request.httpBody = body?.toJSONData()
        
        //Set Conditional Body
        return try URLEncoding(destination: .queryString,
                               arrayEncoding: .brackets,
                               boolEncoding: .literal).encode(request, with: parameters)
    }
}

public enum StaticClientURL {
    public static let rootURL = "https://static.ordermentum.com/"
}

