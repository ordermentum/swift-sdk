//
//  ReadFile.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 17/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    var validationData: [ValidationData]
}

struct ValidationData : Decodable {
    var deliveryDate: String
    var retailerId: String
    var supplierId: String
    var type: String

}

func loadJson(filename fileName: String) -> [ValidationData]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.validationData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
