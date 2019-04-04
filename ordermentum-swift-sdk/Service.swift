//
//  Service.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class Service<D: Decodable> {
    func request(route: URLRequestConvertible, completion: @escaping (Bool, D?) -> ()) {
        AF.request(route)
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let responseData = response.data else {
                            completion(false, nil)
                            return
                        }
                        let responseObject = try JSONSerialization.jsonObject(with: responseData) as? D
                        completion(true, responseObject)
                    } catch {
                        completion(false, nil)
                    }
                    break
                    
                case .failure:
                    completion(false, nil)
                    break
                }
        }
    }
}
