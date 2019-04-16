//
//  Profile.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct UserProfile: Codable {
    public var userId: String = ""
    public var permissions: [String] = []
    public var roles: Roles = Roles()
    public var id: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var fullName: String = ""
    public var name: Name = Name()
    public var profileImage: String = ""
    public var dob: String = ""
    public var email: String = ""
    public var phone: String = ""
    public var defaultNotifications: SupplierNotifications = SupplierNotifications()
    public var entityNotifications: [String: SupplierNotifications] = [:]
    public var parentNotifications: SupplierNotifications = SupplierNotifications()
    public var notifications: Notifications = Notifications()
    public var settings: Settings = Settings()
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var adminPerms: AdminPerms = AdminPerms()
    public var verifiedAt: String = ""
}

public struct Settings: Codable {
    public var accessNewRetailerUi: Bool = false
}

public struct Roles: Codable {
    public var superAdmin: Bool = false
    public var admin: Bool = false
    public var retailers: [RetailerRole] = []
    public var suppliers: [SupplierRole] = []
}

public struct RetailerRole: Codable {
    public var id: String = ""
    public var role: String = ""
}

public struct SupplierRole: Codable {
    public var id: String = ""
    public var role: String = ""
}

public struct Notifications: Codable {
    public var enableSMS: Bool = false
    public var enableEmail: Bool = false
    public var pushNotifications: Bool = false
    public var id: SupplierNotifications = SupplierNotifications()
}

public struct SupplierNotifications: Codable {
    public var alerts: Bool = false
    public var enableSMS: Bool = false
    public var remittance: Bool = false
    public var enableEmail: Bool = false
    public var sendInvoice: Bool = false
    public var placedOrders: Bool = false
    public var overdueOrders: Bool = false
    public var pushNotifications: Bool = false
}

public struct Name: Codable {
    public var first: String = ""
    public var last: String = ""
}

public struct AdminPerms: Codable {
    public var permissions: Permissions = Permissions()
    public var isAdmin: Bool = false
    public var isSuperAdmin: Bool = false
}

public struct Permissions: Codable {
    public var ordermentum: [String] = []
    public var id: [String] = []
    public var customers: [String] = []
}

public struct UpdateUserRequest: Codable {
    public var email: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var phone: String = ""
}

extension UserProfile {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        permissions = try container.decodeIfPresent([String].self, forKey: .permissions) ?? []
        roles = try container.decodeIfPresent(Roles.self, forKey: .roles) ?? Roles()
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName) ?? ""
        name = try container.decodeIfPresent(Name.self, forKey: .name) ?? Name()
        profileImage = try container.decodeIfPresent(String.self, forKey: .profileImage) ?? ""
        dob = try container.decodeIfPresent(String.self, forKey: .dob) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        defaultNotifications = try container.decodeIfPresent(SupplierNotifications.self, forKey: .defaultNotifications) ?? SupplierNotifications()
        entityNotifications = try container.decodeIfPresent([String : SupplierNotifications].self, forKey: .entityNotifications) ?? [:]
        parentNotifications = try container.decodeIfPresent(SupplierNotifications.self, forKey: .parentNotifications) ?? SupplierNotifications()
        notifications = try container.decodeIfPresent(Notifications.self, forKey: .notifications) ?? Notifications()
        settings = try container.decodeIfPresent(Settings.self, forKey: .settings) ?? Settings()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        adminPerms = try container.decodeIfPresent(AdminPerms.self, forKey: .adminPerms) ?? AdminPerms()
        verifiedAt = try container.decodeIfPresent(String.self, forKey: .verifiedAt) ?? ""
    }
}

extension Settings {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        accessNewRetailerUi = try container.decodeIfPresent(Bool.self, forKey: .accessNewRetailerUi) ?? false
    }
}

extension Roles {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        superAdmin = try container.decodeIfPresent(Bool.self, forKey: .superAdmin) ?? false
        admin = try container.decodeIfPresent(Bool.self, forKey: .admin) ?? false
        retailers = try container.decodeIfPresent([RetailerRole].self, forKey: .retailers) ?? []
    }
}

extension RetailerRole {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
    }
}

extension SupplierRole {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
    }
}

extension Notifications {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        enableSMS = try container.decodeIfPresent(Bool.self, forKey: .enableSMS) ?? false
        enableEmail = try container.decodeIfPresent(Bool.self, forKey: .enableEmail) ?? false
        pushNotifications = try container.decodeIfPresent(Bool.self, forKey: .pushNotifications) ?? false
        id = try container.decodeIfPresent(SupplierNotifications.self, forKey: .id) ?? SupplierNotifications()
    }
}

extension SupplierNotifications {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        alerts = try container.decodeIfPresent(Bool.self, forKey: .alerts) ?? false
        enableSMS = try container.decodeIfPresent(Bool.self, forKey: .enableSMS) ?? false
        remittance = try container.decodeIfPresent(Bool.self, forKey: .remittance) ?? false
        enableEmail = try container.decodeIfPresent(Bool.self, forKey: .enableEmail) ?? false
        sendInvoice = try container.decodeIfPresent(Bool.self, forKey: .sendInvoice) ?? false
        placedOrders = try container.decodeIfPresent(Bool.self, forKey: .placedOrders) ?? false
        overdueOrders = try container.decodeIfPresent(Bool.self, forKey: .overdueOrders) ?? false
        pushNotifications = try container.decodeIfPresent(Bool.self, forKey: .pushNotifications) ?? false
    }
}

extension Name {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        first = try container.decodeIfPresent(String.self, forKey: .first) ?? ""
        last = try container.decodeIfPresent(String.self, forKey: .last) ?? ""
    }
}

extension AdminPerms {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        permissions = try container.decodeIfPresent(Permissions.self, forKey: .permissions) ?? Permissions()
        isAdmin = try container.decodeIfPresent(Bool.self, forKey: .isAdmin) ?? false
        isSuperAdmin = try container.decodeIfPresent(Bool.self, forKey: .isSuperAdmin) ?? false
    }
}

extension Permissions {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        ordermentum = try container.decodeIfPresent([String].self, forKey: .ordermentum) ?? []
        id = try container.decodeIfPresent([String].self, forKey: .id) ?? []
        customers = try container.decodeIfPresent([String].self, forKey: .customers) ?? []
    }
}
