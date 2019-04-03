//
//  CodableUtils.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    func safeIntDecode(forKey key: K) throws -> Int? {
        do {
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
            return Int(string)
        } catch {
            return try decodeIfPresent(Int.self, forKey: key)
        }
    }
    
    func safeFloatDecode(forKey key: K) throws -> Float? {
        do {
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
            return Float(string)
        } catch {
            return try decodeIfPresent(Float.self, forKey: key)
        }
    }
    
    func safeStringIntDecode(forKey key: K) throws -> String? {
        do {
            guard let int = try decodeIfPresent(Int.self, forKey: key) else {
                return nil
            }
            return String(describing: int)
        } catch {
            return try decodeIfPresent(String.self, forKey: key)
        }
    }
    
    func safeStringFloatDecode(forKey key: K) throws -> String? {
        do {
            guard let float = try decodeIfPresent(Float.self, forKey: key) else {
                return nil
            }
            return String(describing: float)
        } catch {
            return try decodeIfPresent(String.self, forKey: key)
        }
    }
    
    func safeBoolDecode(forKey key: K)  throws -> Bool? {
        do {
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
            let lowercased = string.lowercased()
            if lowercased == "true" {
                return true
            }
            if lowercased == "1" {
                return true
            }
            if lowercased == "yes" {
                return true
            }
            return false
        } catch {
            return try decodeIfPresent(Bool.self, forKey: key)
        }
    }
}

extension Encodable {
    func jsonString() -> String {
        guard let data = try? JSONEncoder().encode(self) else {
            return ""
        }
        return data.utf8String()
    }
}

extension Decodable {
    func describing() -> String {
        return String(describing: self)
    }
}
