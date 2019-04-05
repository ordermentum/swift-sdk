////
////  FlagsRouter.swift
////  ordermentum-swift-sdk
////
////  Created by Brandon Stillitano on 5/4/19.
////  Copyright © 2019 Ordermentum. All rights reserved.
////
//
//import Foundation
//import Alamofire
///**
// * Get the flags belonging to a retailer/supplier relationship
// * Returns a Flags object
// */
//@GET("flags/check")
//fun getFlags(@Query("flags[]") flags: List<String>,
//@Query("supplierId[]") supplierId: List<String>,
//@Query("context[retailerId]") retailerId: String,
//@Query("context[userId]") userId: String): Observable<Flags>
//
//public enum FlagsRouter: URLRequestConvertible {
//    //Routes
//    case getFlags([String], [String], String, String)
//    
//    //Methods
//    var method: HTTPMethod {
//        switch self {
//        case .getFlags:
//            return .get
//        }
//    }
//    
//    //Paths
//    var path: String {
//        switch self {
//        case .getSuppliers:
//            return "suppliers/directory"
//        case .sendSupplierEnquiry:
//            return "suppliers/enquiry"
//        case .sendSupplierReferral:
//            return "suppliers/referral"
//        }
//    }
//    
//    //Parameters
//    var parameters: [String: Any] {
//        switch self {
//        case .getSuppliers(let searchString, let pageSize):
//            return ["search": searchString, "pageSize": pageSize]
//        default:
//            return [:]
//        }
//    }
//    
//    //Body
//    var body: Codable? {
//        switch self {
//        case .sendSupplierEnquiry(let requestObject):
//            return requestObject
//        case .sendSupplierReferral(let requestObject):
//            return requestObject
//        default:
//            return nil
//        }
//    }
//    
//    //Builder
//    public func asURLRequest() throws -> URLRequest {
//        //Setup Data
//        let url = try Client.instance.baseURL.asURL()
//        let timeoutSeconds: Int = 10
//        
//        //Build Request
//        var request = URLRequest(url: url.appendingPathComponent(path))
//        request.httpMethod = method.rawValue
//        request.setValue(Client.instance.getHeaderToken(), forHTTPHeaderField: "Authorization")
//        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
//        
//        //Set Conditional Body
//        if body != nil {
//            request.httpBody = body?.toJSONData()
//        }
//        
//        return try URLEncoding.default.encode(request, with: parameters)
//    }
//}
//
