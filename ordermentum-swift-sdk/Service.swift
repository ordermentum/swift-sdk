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
                            completion(true, nil)
                            return
                        }
                        print(responseData.utf8String())
                        let responseObject = try JSONDecoder().decode(D.self, from: responseData)
                        completion(true, responseObject)
                    } catch {
                        completion(true, nil)
                    }
                    break
                    
                case .failure:
                    completion(false, nil)
                    break
                }
        }
    }
}
