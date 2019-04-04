//
//  CreditNotesService.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

class CreditNotesService {
    /**
     * Get the credit notes belonging to a purchaser
     * Returns a CreditNotesResponse
     */
    func getCreditNotes(purchaserId: String, pageSize: Int, pageNo: Int, completion: @escaping (Bool, CreditNotesResponse?) -> ()) {
        //Build Route
        let route = CreditNotesRouter.getCreditNotes(purchaserId, pageSize, pageNo) as URLRequestConvertible
        
        //Call API
        Service<CreditNotesResponse>().request(route: route) { (result, responseObject) in
            completion(result, responseObject)
        }
    }
}
