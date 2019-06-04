//
//  OMAppVersionService.swift
//  Ordermentum
//
//  Created by Ryan Castro on 07/09/2018.
//  Copyright © 2018 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation
import Alamofire

public class AppVersionService {
    public init() {}
    public func checkVersion(completion: @escaping (Bool, AppVersion? ) -> ()) {
        //Build Route
        do{
            let route = try Client.instance.urlRequest(path: "https://static.ordermentum.com/ios/manifest.json", method: .get, parameters: [:], body: nil) as URLRequestConvertible
            
            //Call API
            Service<AppVersion>().request(route: route) { (result, responseObject) in
                completion(result, responseObject)
            }
        }
        catch
        {
            print("Error: \(error)")
        }
        
    }
}
