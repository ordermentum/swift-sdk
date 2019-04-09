//
//  Venue.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

struct VenueResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Venue] = []
}

struct Venue {
    var id: String = ""
    var name: String = ""
    var legalName: String = ""
    var tradingName: String = ""
    var email: String = ""
    var phone: String = ""
    var dataAttributes: DataAttributes = DataAttributes()
    var liquorLicense: String = ""
    var abn: String = ""
    var suppliers: [Supplier] = []
    var user: User = User()
    var address: VenueAddress = VenueAddress()
    var addressId: String = ""
    var billingAddress: Address = Address()
    var billingAddressId: String = ""
    var sameDeliveryAndBillingAddress: Bool = false
    var settings: VenueSettings = VenueSettings()
    var createdAt: String = ""
    var updatedAt: String = ""
}

struct VenueAccountSettings: Encodable {
    var flags: [String] = []
    var insights: Insights = Insights()
    var orderPrefix: String = ""
    var orderExports: OrderExports = OrderExports()
    var invoicePrefix: String = ""
    var productExports: ProductExports = ProductExports()
    var retailerExports: RetailerExports = RetailerExports()
    var enableDeliveryDate: Bool = false
    var defaultDeliveryDelay: Int = 0
}

struct VenueAddress {
    var formatted: String = ""
    var id: String = ""
    var name: String = ""
    var number: String = ""
    var type: String = ""
    var description: String = ""
    var street1: String = ""
    var street2: String = ""
    var suburb: String = ""
    var state: String = ""
    var postcode: String = ""
    var country: String = ""
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var addressableType: String = ""
    var addressableId: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var deleted_at: String = ""
}

struct VenueBrand {
    var logo: VenueImage = VenueImage()
    var images: [VenueImage] = []
}

struct VenueImage {
    var url: String = ""
    var width: Int = 0
    var format: String = ""
    var height: Int = 0
    var version: Int = 0
    var public_id: String = ""
    var signature: String = ""
    var secure_url: String = ""
    var resource_type: String = ""
}

struct VenueSettings {
    var flags: [String] = []
    var brand: VenueBrand = VenueBrand()
}

struct User {
    var id: String = ""
    var email: String = ""
    var dob: String = ""
    var phone: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
    var deletedAt: String = ""
    var passwordResetToken: String = ""
    var passwordResetSentAt: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var deleted_at: String = ""
}

struct VenueUsersResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [User] = []
}

public struct RemoveUser: Codable {
    var entityId: String = ""
    var perms: [String] = []
}

public struct AddUser: Codable {
    var senderId: String = ""
    var senderType: String = ""
    var senderEntityName: String = ""
    var recipientEntityType: String = ""
    var recipientEntityId: String = ""
    var recipientEmail: String = ""
    var recipientFirstName: String = ""
    var recipientLastName: String = ""
    var role: String = ""
    var inviteType: String = ""
}

struct AddUserResponse {
    var id: String = ""
    var senderEntityName: String = ""
    var senderId: String = ""
    var recipientFirstName: String = ""
    var recipientLastName: String = ""
    var recipientFullName: String = ""
    var recipientPhone: String = ""
    var recipientEntityName: String = ""
    var referenceId: String = ""
    var status: String = ""
    var permissions: [String] = []
    var isApproved: Bool = false
    var approvedByName: String = ""
    var createdAt: String = ""
    var createdByName: String = ""
    var updatedAt: String = ""
}

extension VenueResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Venue].self, forKey: .data) ?? []
    }
}

extension Venue: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        legalName = try container.decodeIfPresent(String.self, forKey: .legalName) ?? ""
        tradingName = try container.decodeIfPresent(String.self, forKey: .tradingName) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        dataAttributes = try container.decodeIfPresent(DataAttributes.self, forKey: .dataAttributes) ?? DataAttributes()
        liquorLicense = try container.decodeIfPresent(String.self, forKey: .liquorLicense) ?? ""
        abn = try container.decodeIfPresent(String.self, forKey: .abn) ?? ""
        suppliers = try container.decodeIfPresent([Supplier].self, forKey: .suppliers) ?? []
        user = try container.decodeIfPresent(User.self, forKey: .user) ?? User()
        address = try container.decodeIfPresent(VenueAddress.self, forKey: .address) ?? VenueAddress()
        addressId = try container.decodeIfPresent(String.self, forKey: .addressId) ?? ""
        billingAddress = try container.decodeIfPresent(Address.self, forKey: .billingAddress) ?? Address()
        billingAddressId = try container.decodeIfPresent(String.self, forKey: .billingAddressId) ?? ""
        sameDeliveryAndBillingAddress = try container.decodeIfPresent(Bool.self, forKey: .sameDeliveryAndBillingAddress) ?? false
        settings = try container.decodeIfPresent(VenueSettings.self, forKey: .settings) ?? VenueSettings()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}

extension VenueAccountSettings: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        insights = try container.decodeIfPresent(Insights.self, forKey: .insights) ?? Insights()
        orderPrefix = try container.decodeIfPresent(String.self, forKey: .orderPrefix) ?? ""
        orderExports = try container.decodeIfPresent(OrderExports.self, forKey: .orderExports) ?? OrderExports()
        invoicePrefix = try container.decodeIfPresent(String.self, forKey: .invoicePrefix) ?? ""
        productExports = try container.decodeIfPresent(ProductExports.self, forKey: .productExports) ?? ProductExports()
        retailerExports = try container.decodeIfPresent(RetailerExports.self, forKey: .retailerExports) ?? RetailerExports()
        enableDeliveryDate = try container.decodeIfPresent(Bool.self, forKey: .enableDeliveryDate) ?? false
        defaultDeliveryDelay = try container.safeIntDecode(forKey: .defaultDeliveryDelay) ?? 0
    }
}

extension VenueAddress: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        formatted = try container.decodeIfPresent(String.self, forKey: .formatted) ?? ""
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        street1 = try container.decodeIfPresent(String.self, forKey: .street1) ?? ""
        street2 = try container.decodeIfPresent(String.self, forKey: .street2) ?? ""
        suburb = try container.decodeIfPresent(String.self, forKey: .suburb) ?? ""
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        postcode = try container.decodeIfPresent(String.self, forKey: .postcode) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        latitude = try container.decodeIfPresent(Float.self, forKey: .latitude) ?? 0
        longitude = try container.decodeIfPresent(Float.self, forKey: .longitude) ?? 0
        addressableType = try container.decodeIfPresent(String.self, forKey: .addressableType) ?? ""
        addressableId = try container.decodeIfPresent(String.self, forKey: .addressableId) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
    }
}

extension VenueBrand: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        images = try container.decodeIfPresent([VenueImage].self, forKey: .images) ?? []
        logo = try container.decodeIfPresent(VenueImage.self, forKey: .logo) ?? VenueImage()
    }
}

extension VenueImage: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        width = try container.decodeIfPresent(Int.self, forKey: .width) ?? 0
        format = try container.decodeIfPresent(String.self, forKey: .format) ?? ""
        height = try container.decodeIfPresent(Int.self, forKey: .height) ?? 0
        version = try container.decodeIfPresent(Int.self, forKey: .version) ?? 0
        public_id = try container.decodeIfPresent(String.self, forKey: .public_id) ?? ""
        signature = try container.decodeIfPresent(String.self, forKey: .signature) ?? ""
        secure_url = try container.decodeIfPresent(String.self, forKey: .secure_url) ?? ""
        resource_type = try container.decodeIfPresent(String.self, forKey: .resource_type) ?? ""
    }
}

extension VenueSettings: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        brand = try container.decodeIfPresent(VenueBrand.self, forKey: .brand) ?? VenueBrand()
    }
}

extension VenueUsersResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([User].self, forKey: .data) ?? []
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        dob = try container.decodeIfPresent(String.self, forKey: .dob) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        passwordResetToken = try container.decodeIfPresent(String.self, forKey: .passwordResetToken) ?? ""
        passwordResetSentAt = try container.decodeIfPresent(String.self, forKey: .passwordResetSentAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
    }
}

extension AddUserResponse: Decodable {
    init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        senderEntityName = try container.decodeIfPresent(String.self, forKey: .senderEntityName) ?? ""
        senderId = try container.decodeIfPresent(String.self, forKey: .senderId) ?? ""
        recipientFirstName = try container.decodeIfPresent(String.self, forKey: .recipientFirstName) ?? ""
        recipientLastName = try container.decodeIfPresent(String.self, forKey: .recipientLastName) ?? ""
        recipientFullName = try container.decodeIfPresent(String.self, forKey: .recipientFullName) ?? ""
        recipientPhone = try container.decodeIfPresent(String.self, forKey: .recipientPhone) ?? ""
        recipientEntityName = try container.decodeIfPresent(String.self, forKey: .recipientEntityName) ?? ""
        referenceId = try container.decodeIfPresent(String.self, forKey: .referenceId) ?? ""
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        permissions = try container.decodeIfPresent([String].self, forKey: .permissions) ?? []
        isApproved = try container.decodeIfPresent(Bool.self, forKey: .isApproved) ?? false
        approvedByName = try container.decodeIfPresent(String.self, forKey: .approvedByName) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        createdByName = try container.decodeIfPresent(String.self, forKey: .createdByName) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}

extension Venue: Equatable {
    static func == (lhs: Venue, rhs: Venue) -> Bool {
        return lhs.id == rhs.id
    }
}

extension User {
    var fullName: String {
        return self.firstName + " " + self.lastName
    }
}

