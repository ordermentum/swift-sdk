//
//  Paginator.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 10/7/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import UIKit

typealias PaginatorCompletion = (Paginator) -> Void

protocol PaginatorDelegate: class {
    func paginatorFetch(_ sender: Paginator)
}

class Paginator: NSObject {
    //Data
    public var pageNo: Int = 0
    public var maxPages: Int = 0
    public var hasRun: Bool = false
    
    //Delegate
    public weak var delegate: PaginatorDelegate?
    
    func nextPage(completion: PaginatorCompletion?) {
        //Check Page Number
        if hasRun {
            guard pageNo < maxPages else {
                return
            }
        }
        
        //Set Data
        hasRun = true
        pageNo += 1
        delegate?.paginatorFetch(self)
    }
    
    func reset() {
        hasRun = false
        pageNo = 0
        maxPages = 0
    }
}
