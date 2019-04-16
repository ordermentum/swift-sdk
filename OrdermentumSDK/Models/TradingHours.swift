//
//  TradingHours.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct TradingHours: Codable {
    var enabled: Bool = false
    var mon: TradingHoursDay = TradingHoursDay()
    var tue: TradingHoursDay = TradingHoursDay()
    var wed: TradingHoursDay = TradingHoursDay()
    var thu: TradingHoursDay = TradingHoursDay()
    var fri: TradingHoursDay = TradingHoursDay()
    var sat: TradingHoursDay = TradingHoursDay()
    var sun: TradingHoursDay = TradingHoursDay()
}

public struct TradingHoursDay: Codable {
    var isOpen: Bool = false
    var closeHour: Int = 17
    var closeMinute: Int = 0
    var openHour: Int = 9
    var openMinute: Int = 0
}

extension TradingHours {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode bankingData
        enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled) ?? false
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
        isOpen = try container.decodeIfPresent(Bool.self, forKey: .isOpen) ?? false
        closeHour = try container.decodeIfPresent(Int.self, forKey: .closeHour) ?? 17
        closeMinute = try container.decodeIfPresent(Int.self, forKey: .closeMinute) ?? 0
        openHour = try container.decodeIfPresent(Int.self, forKey: .openHour) ?? 9
        openMinute = try container.decodeIfPresent(Int.self, forKey: .openMinute) ?? 0
    }
}
