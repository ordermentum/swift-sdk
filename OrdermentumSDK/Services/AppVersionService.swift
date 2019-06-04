//
//  OMAppVersionService.swift
//  Ordermentum
//
//  Created by Ryan Castro on 07/09/2018.
//  Copyright © 2018 Ordermentum Pty Ltd. All rights reserved.
//

import UIKit

struct AppVersion: Decodable {
    var minimumAppVersion: String?
    enum CodingKeys: String, CodingKey {
        case minimumAppVersion = "minimum-version"
    }

    static func == (lhs: OMAppVersion, rhs: OMAppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedSame
    }

    static func < (lhs: OMAppVersion, rhs: OMAppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedAscending
    }

    static func <= (lhs: OMAppVersion, rhs: OMAppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedAscending || version1.compare(version2, options: .numeric) == .orderedSame
    }

    static func > (lhs: OMAppVersion, rhs: OMAppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedDescending
    }

    static func >= (lhs: OMAppVersion, rhs: OMAppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedDescending || version1.compare(version2, options: .numeric) == .orderedSame
    }

}

class AppVersionService <ExpectedResponse: Decodable> {

    func checkVersion(completion: @escaping APICompletionHandler<ExpectedResponse>) {
        let codableService = CodableService<ExpectedResponse>()
        let urlString = "https://static.ordermentum.com/ios/manifest.json"
        codableService.defaultRequest(urlString: urlString) { (appVersion, _, error) in
            var apiResponse = APIResponse<ExpectedResponse>(apiStatus: APIStatus.success, data: appVersion, error: error)
            guard error == nil else {
                apiResponse.apiStatus = .error
                completion(apiResponse)
                return
            }
            guard appVersion.decoded != nil else {
                apiResponse.apiStatus = .failed
                completion(apiResponse)
                return
            }
            completion(apiResponse)
        }
    }
}
