//
//  NotificationsClient.swift
//  OrdermentumSDK
//
//  Created by Joseph Fabian on 6/19/20.

import Foundation
import Alamofire

public class NotificationsClient {
    //Data
    public var baseURL: String = ""
    public var token: String = ""
    public var headers: [String: String] = [:]

    //Private Init to Stop Re-Initialisation
    private init() {}
    public static let instance = NotificationsClient()

    //Services
    public var experiments: NotificationsService = NotificationsService()

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

public enum NotificationsClientURL {
    public static let rootNotificationURL = "https://notifications.ordermentum.com/v2/"
    public static let rootNotificationTestingURL = "https://notifications.ordermentum-sandbox.com/v2/"
}
