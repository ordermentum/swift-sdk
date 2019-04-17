//
//  Venue.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct VenueResponse {
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Venue] = []
}

public struct Venue {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
    public var legalName: String = ""
    public var tradingName: String = ""
    public var email: String = ""
    public var phone: String = ""
    public var dataAttributes: DataAttributes = DataAttributes()
    public var liquorLicense: String = ""
    public var abn: String = ""
    public var suppliers: [Supplier] = []
    public var user: User = User()
    public var address: VenueAddress = VenueAddress()
    public var addressId: String = ""
    public var billingAddress: Address = Address()
    public var billingAddressId: String = ""
    public var sameDeliveryAndBillingAddress: Bool = false
    public var settings: VenueSettings = VenueSettings()
    public var createdAt: String = ""
    public var updatedAt: String = ""
}

public struct VenueAccountSettings: Encodable {
    public init() {}
    
    public var flags: [String] = []
    public var insights: Insights = Insights()
    public var orderPrefix: String = ""
    public var orderExports: OrderExports = OrderExports()
    public var invoicePrefix: String = ""
    public var productExports: ProductExports = ProductExports()
    public var retailerExports: RetailerExports = RetailerExports()
    public var enableDeliveryDate: Bool = false
    public var defaultDeliveryDelay: Int = 0
}

public struct VenueAddress {
    public init() {}
    
    public var formatted: String = ""
    public var id: String = ""
    public var name: String = ""
    public var number: String = ""
    public var type: String = ""
    public var description: String = ""
    public var street1: String = ""
    public var street2: String = ""
    public var suburb: String = ""
    public var state: String = ""
    public var postcode: String = ""
    public var country: String = ""
    public var latitude: Float = 0.0
    public var longitude: Float = 0.0
    public var addressableType: String = ""
    public var addressableId: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var deleted_at: String = ""
}

public struct VenueBrand {
    public var logo: VenueImage = VenueImage()
    public var images: [VenueImage] = []
}

public struct VenueImage {
    public var url: String = ""
    public var width: Int = 0
    public var format: String = ""
    public var height: Int = 0
    public var version: Int = 0
    public var public_id: String = ""
    public var signature: String = ""
    public var secure_url: String = ""
    public var resource_type: String = ""
}

public struct VenueSettings {
    public init() {}
    
    public var flags: [String] = []
    public var brand: VenueBrand = VenueBrand()
}

public struct User {
    public init() {}
    
    public var id: String = ""
    public var email: String = ""
    public var dob: String = ""
    public var phone: String = ""
    public var firstName: String = ""
    public var lastName: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var passwordResetToken: String = ""
    public var passwordResetSentAt: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var deleted_at: String = ""
}

public struct VenueUsersResponse {
    public init() {}
    
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [User] = []
}

public struct RemoveUser: Codable {
    public init() {}
    
    public var entityId: String = ""
    public var perms: [String] = []
}

public struct AddUser: Codable {
    public init() {}
    
    public var senderId: String = ""
    public var senderType: String = ""
    public var senderEntityName: String = ""
    public var recipientEntityType: String = ""
    public var recipientEntityId: String = ""
    public var recipientEmail: String = ""
    public var recipientFirstName: String = ""
    public var recipientLastName: String = ""
    public var role: String = ""
    public var inviteType: String = ""
}

public struct AddUserResponse {
    public var id: String = ""
    public var senderEntityName: String = ""
    public var senderId: String = ""
    public var recipientFirstName: String = ""
    public var recipientLastName: String = ""
    public var recipientFullName: String = ""
    public var recipientPhone: String = ""
    public var recipientEntityName: String = ""
    public var referenceId: String = ""
    public var status: String = ""
    public var permissions: [String] = []
    public var isApproved: Bool = false
    public var approvedByName: String = ""
    public var createdAt: String = ""
    public var createdByName: String = ""
    public var updatedAt: String = ""
}

extension VenueResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Venue].self, forKey: .data) ?? []
    }
}

extension Venue: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        images = try container.decodeIfPresent([VenueImage].self, forKey: .images) ?? []
        logo = try container.decodeIfPresent(VenueImage.self, forKey: .logo) ?? VenueImage()
    }
}

extension VenueImage: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        brand = try container.decodeIfPresent(VenueBrand.self, forKey: .brand) ?? VenueBrand()
    }
}

extension VenueUsersResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([User].self, forKey: .data) ?? []
    }
}

extension User: Decodable {
    public init(from decoder: Decoder) throws {
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
    public init(from decoder: Decoder) throws {
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
    public static func == (lhs: Venue, rhs: Venue) -> Bool {
        return lhs.id == rhs.id
    }
}

extension User {
    public var fullName: String {
        return self.firstName + " " + self.lastName
    }
}

