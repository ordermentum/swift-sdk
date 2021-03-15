//
//  Service.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class Service<D: Decodable, E: Decodable> {
    func request(route: URLRequestConvertible, completion: @escaping (Bool, D?, E?) -> Void) {
        AF.request(route)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        guard let responseData = response.data else {
                            completion(true, nil, nil)
                            return
                        }
                        let responseObject = try JSONDecoder().decode(D.self, from: responseData)
                        completion(true, responseObject, nil)
                    } catch {
                        completion(true, nil, nil)
                    }
                    break
                    
                case .failure:
                    //This catches successful requests that return an empty body. Alamofire has a known limitation where it will fail when .validate() is added to a request with an "Accept" header.
                    if (200 ... 299).contains(response.response?.statusCode ?? 0) {
                        completion(true, nil, nil)
                    } else {
                        do {
                            guard let responseData = response.data else {
                                completion(false, nil, nil)
                                return
                            }
                            let errorObject = try JSONDecoder().decode(E.self, from: responseData)
                            completion(false, nil, errorObject)
                        } catch {
                            completion(false, nil, nil)
                    }
                    break
                }
            }
        }
    }
}
