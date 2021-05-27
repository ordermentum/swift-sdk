//
//  DocumentumClient.swift
//  
//
//  Created by Brandon Stillitano on 27/5/21.
///

import Foundation
import Alamofire

public class DocumentumClient {
    //Data
    public var baseURL: String = DocumentumClientURL.rootURL
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = DocumentumClient()
    
    //Services
    public var documentum: DocumentumService = DocumentumService()
    
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

public enum DocumentumClientURL {
    public static let rootURL = "https://documentum.ordermentum.com/"
    public static let rootTestingURL = "https://documentum.ordermentum-sandbox.com/"
}
