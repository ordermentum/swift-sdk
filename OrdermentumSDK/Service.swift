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
    func request(route: URLRequestConvertible, completion: @escaping (Bool, D?, E?) -> ()) {
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
                        print(responseData.utf8String())
                        let responseObject = try JSONDecoder().decode(D.self, from: responseData)
                        completion(true, responseObject, nil)
                    } catch {
                        completion(true, nil, nil)
                    }
                    break
                    
                case .failure:
                    do {
                        guard let responseData = response.data else {
                            completion(false, nil, nil)
                            return
                        }
                        print(responseData.utf8String())
                        let errorObject = try JSONDecoder().decode(E.self, from: responseData)
                        completion(true, nil, errorObject)
                    } catch {
                        completion(true, nil, nil)
                    }
                    break
                }
        }
    }
}
