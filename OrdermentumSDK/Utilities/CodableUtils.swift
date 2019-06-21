//
//  CodableUtils.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

extension KeyedDecodingContainer {
    func safeIntDecode(forKey key: K) throws -> Int? {
        do {
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
            return Int(string)
        } catch {
            return try safeIntDecode(forKey: key)
        }
    }
    
    func safeFloatDecode(forKey key: K) throws -> Float? {
        do {
            guard let string = try decodeIfPresent(String.self, forKey: key) else {
                return nil
            }
            return Float(string)
        } catch {
            return try safeFloatDecode(forKey: key)
        }
    }
    
    func safeStringIntDecode(forKey key: K) throws -> String? {
        do {
            guard let int = try safeIntDecode(forKey: key) else {
                return nil
            }
            return String(describing: int)
        } catch {
            return try decodeIfPresent(String.self, forKey: key)
        }
    }
    
    func safeStringFloatDecode(forKey key: K) throws -> String? {
        do {
            guard let float = try safeFloatDecode(forKey: key) else {
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
            return try safeBoolDecode(forKey: key)
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
    
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
    
    func toParameters() -> Parameters {
        //Setup Data
        var parametersDictionary: Parameters = Parameters()
        let codableDictionary = try? self.asDictionary()
        
        //Iterrate Codable
        for value in codableDictionary ?? [:] {
            parametersDictionary[value.key] = value.value
        }
        
        return parametersDictionary
    }
}

extension Decodable {
    func describing() -> String {
        return String(describing: self)
    }
}
