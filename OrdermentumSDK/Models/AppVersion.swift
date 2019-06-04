//
//  AppVersion.swift
//  OrdermentumSDK
//
//  Created by Mark Kenneth Bayona on 04/06/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct AppVersion: Decodable {
    
    public var minimumAppVersion: String?
    enum CodingKeys: String, CodingKey {
        case minimumAppVersion = "minimum-version"
    }
    
    public init(minimumAppVersion: String?) {
        self.minimumAppVersion = minimumAppVersion
    }
    public static func == (lhs: AppVersion, rhs: AppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedSame
    }
    
    public static func < (lhs: AppVersion, rhs: AppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedAscending
    }
    
    public static func <= (lhs: AppVersion, rhs: AppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedAscending || version1.compare(version2, options: .numeric) == .orderedSame
    }
    
    public static func > (lhs: AppVersion, rhs: AppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedDescending
    }
    
    public static func >= (lhs: AppVersion, rhs: AppVersion) -> Bool {
        guard let version1 = lhs.minimumAppVersion, let version2 = rhs.minimumAppVersion else {
            return false
        }
        return version1.compare(version2, options: .numeric) == .orderedDescending || version1.compare(version2, options: .numeric) == .orderedSame
    }
    
}
