//
//  CreateProfile.swift
//  OrdermentumSDK
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation

public struct CreateUserProfile: Codable {
    var userId: String = ""
    var permissions: [String] = []
    var roles: Roles = Roles()
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String = ""
    var name: Name = Name()
    var profileImage: String = ""
    var dob: String = ""
    var email: String = ""
    var phone: String = ""
    var defaultNotifications: SupplierNotifications = SupplierNotifications()
    var entityNotifications: [String: SupplierNotifications] = [:]
    var parentNotifications: SupplierNotifications = SupplierNotifications()
    var notifications: Notifications = Notifications()
    var settings: Settings = Settings()
    var createdAt: String = ""
    var updatedAt: String = ""
    var adminPerms: AdminPerms = AdminPerms()
    var verifiedAt: String = ""
}

