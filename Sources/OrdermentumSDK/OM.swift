//
//  File.swift
//
//
//  Created by Brandon Stillitano on 28/5/21.
//

import Foundation
import Alamofire

public class Endpoints {
    public init() { }

    public var auth: String = ""
    public var documentum: String = ""
    public var flags: String = ""
    public var ordermentum: String = ""
    public var support: String = ""
}

public class OM {
    //Data
    public var token: String = ""
    public var headers: [String: String] = [:]
    public var endpoints: Endpoints = Endpoints()

    //Private Init to Stop Re-Initialisation
    private init() { }
    public static let instance = OM()

    //Services
    public var documentum = DocumentumService.self

    // MARK: Convenience Methods
    public func getHeaderToken() -> String {
        return String(format: "Bearer \(token)")
    }

    public func urlRequest(baseURL: String, path: String?, method: HTTPMethod, parameters: Parameters, body: Codable?, contentType: ContentType, timeout: Int = 10) throws -> URLRequest {
        //Setup Data
        let url = try baseURL.asURL()
        let timeoutSeconds: Int = timeout

        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path ?? ""))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        request.httpBody = body?.toJSONData()
        request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
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
