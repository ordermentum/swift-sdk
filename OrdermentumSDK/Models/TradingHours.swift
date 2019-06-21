//
//  TradingHours.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct TradingHours: Codable {
    public init() {}
    
    public var enabled: Bool = false
    public var mon: TradingHoursDay = TradingHoursDay()
    public var tue: TradingHoursDay = TradingHoursDay()
    public var wed: TradingHoursDay = TradingHoursDay()
    public var thu: TradingHoursDay = TradingHoursDay()
    public var fri: TradingHoursDay = TradingHoursDay()
    public var sat: TradingHoursDay = TradingHoursDay()
    public var sun: TradingHoursDay = TradingHoursDay()
}

public struct TradingHoursDay: Codable {
    public init() {}
    
    public var isOpen: Bool = false
    public var closeHour: Int = 17
    public var closeMinute: Int = 0
    public var openHour: Int = 9
    public var openMinute: Int = 0
}

extension TradingHours {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode bankingData
        enabled = try container.safeBoolDecode(forKey: .enabled) ?? false
        mon = try container.decodeIfPresent(TradingHoursDay.self, forKey: .mon) ?? TradingHoursDay()
        tue = try container.decodeIfPresent(TradingHoursDay.self, forKey: .tue) ?? TradingHoursDay()
        wed = try container.decodeIfPresent(TradingHoursDay.self, forKey: .wed) ?? TradingHoursDay()
        thu = try container.decodeIfPresent(TradingHoursDay.self, forKey: .thu) ?? TradingHoursDay()
        fri = try container.decodeIfPresent(TradingHoursDay.self, forKey: .fri) ?? TradingHoursDay()
        sat = try container.decodeIfPresent(TradingHoursDay.self, forKey: .sat) ?? TradingHoursDay()
        sun = try container.decodeIfPresent(TradingHoursDay.self, forKey: .sun) ?? TradingHoursDay()
    }
}

extension TradingHoursDay {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode bankingData
        isOpen = try container.safeBoolDecode(forKey: .isOpen) ?? false
        closeHour = try container.safeIntDecode(forKey: .closeHour) ?? 17
        closeMinute = try container.safeIntDecode(forKey: .closeMinute) ?? 0
        openHour = try container.safeIntDecode(forKey: .openHour) ?? 9
        openMinute = try container.safeIntDecode(forKey: .openMinute) ?? 0
    }
}
