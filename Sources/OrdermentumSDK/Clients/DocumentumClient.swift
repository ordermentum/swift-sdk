//
//  DocumentumClient.swift
//  
//
//  Created by Brandon Stillitano on 27/5/21.
///

import Foundation
import Alamofire

internal class DocumentumClient {
    //Data
    public var baseURL: String = ""
    public var token: String = ""
    public var headers: [String: String] = [:]
    
    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = DocumentumClient()
    
    //Services
    public var documentum: DocumentumService = DocumentumService()
    
    // MARK: Convenience Methods
    public func getHeaderToken() -> String {
        return String(format: "Bearer \(token)")
    }

    public func urlRequest(path: String, method: HTTPMethod, parameters: Parameters, body: Codable?, timeout: Int = 10) throws -> URLRequest {
        //Setup Data
        let url = try baseURL.asURL()
        let timeoutSeconds: Int = timeout

        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        request.httpBody = body?.toJSONData()
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        //Set Headers
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }

        //Set Token
        if !token.isEmpty {
            request.setValue(getHeaderToken(), forHTTPHeaderField: "Authorization")
        }

        //Set Conditional Body
        return try URLEncoding(destination: .queryString,
                               arrayEncoding: .brackets,
                               boolEncoding: .literal).encode(request, with: parameters.filter { $0.value != nil })
    }
}

public enum DocumentumClientURL {
    public static let rootURL = "https://documentum.ordermentum.com/"
    public static let rootTestingURL = "https://documentum.ordermentum-sandbox.com/"
}
