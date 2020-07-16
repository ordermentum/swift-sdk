//
//  CreditNotesService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class CreditNotesService {
    public init() {}
    
    /**
     * Get the credit notes belonging to a purchaser
     * Returns a CreditNotesResponse
     */
    public func getCreditNotes(purchaserId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, CreditNotesResponse?, ErrorResponse?) -> Void) {
        //Build Route
        let route = CreditNotesRouter.getCreditNotes(purchaserId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<CreditNotesResponse, ErrorResponse>().request(route: route) { (result, responseObject, errorObject) in
            completion(result, responseObject, errorObject)
        }
    }
}
