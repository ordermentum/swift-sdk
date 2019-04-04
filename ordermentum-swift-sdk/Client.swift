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
    
}

enum ClientURL {
    static let rootURL = "https://app.ordermentum.com/v1/"
    static let rootWebURL = "https://app.ordermentum.com/"
    static let rootTestingURL = "https://app-testing.ordermentum.com/v1/"
    static let rootTestingWebURL = "https://app-testing.ordermentum.com/"
}
