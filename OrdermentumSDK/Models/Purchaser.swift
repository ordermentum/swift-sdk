//
//  Purchaser.swift
//  OrdermentumSDK
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct PurchaserResponse {
    public init() {}
    
    public var meta: Meta = Meta()
    public var links: Links = Links()
    public var data: [Purchaser] = []
}

public struct Purchaser {
    public init() {}
    
    public var id: String = ""
    public var reference: String = ""
    public var name: String = ""
    public var retailerName: String = ""
    public var retailerAlias: String = ""
    public var retailerLegalName: String = ""
    public var retailerTradingName: String = ""
    public var retailerPhone: String = ""
    public var retailerEmail: String = ""
    public var retailerAddress: RetailerAddress = RetailerAddress()
    public var billingAddress: Address = Address()
    public var retailerDataAttributes: RetailerDataAttributes = RetailerDataAttributes()
    public var retailerAddressLine: String = ""
    public var billingAddressLine: String = ""
    public var retailerId: String = ""
    public var retailer: Retailer = Retailer()
    public var supplierId: String = ""
    public var supplier: Supplier = Supplier()
    public var invoiceSetting: String = ""
    public var invoiceFrequency: String = ""
    public var paymentTerms: String = ""
    public var paymentDelay: Int = 0
    public var paymentMethodTypes: PaymentMethodTypes = PaymentMethodTypes()
    public var paymentMethodId: String?
    public var defaultPaymentMethodType: PaymentMethodType = PaymentMethodType()
    public var paymentMethod: PurchaserPaymentMethod = PurchaserPaymentMethod()
    public var paymentSchedule: String = ""
    public var canCharge: Bool = false
    public var freightGroupId: String = ""
    public var freightGroup: FreightGroup = FreightGroup()
    public var visibilityGroupId: String = ""
    public var visibilityGroup: VisibilityGroup = VisibilityGroup()
    public var priceGroupId: String = ""
    public var priceGroup: PriceGroup = PriceGroup()
    public var stopCredit: Bool = false
    public var archived: Bool = false
    public var minimumOrderValue: Float = 0
    public var disabled: Bool = false
    public var deliveryInstructions: String = ""
    public var notes: String = ""
    public var schedules: [Schedule] = []
    public var externalCustomerId: String = ""
    public var properties: PurchaserProperties = PurchaserProperties()
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var orderedAt: String = ""
}

public struct PurchaserTerms {
    public init() {}
    
    public var id: String = ""
    public var supplierId: String = ""
    public var content: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var agreementRequired: Bool = false
    public var hasAgreed: Bool = false
    public var lastAgreed: String = ""
}

public struct PaymentMethodTypes {
    public init() {}
    
    public var value: [String] = []
    public var display: String = ""
}

public struct PaymentMethodType: Encodable {
    public init() {}
    
    public var display: String = ""
    public var value: String = ""
}

public struct Schedule {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
}

public struct RetailerAddress {
    public init() {}
    
    public var number: String = ""
    public var street1: String = ""
    public var street2: String = ""
    public var suburb: String = ""
    public var state: String = ""
    public var postcode: String = ""
    public var country: String = ""
    public var description: String = ""
    public var type: String = ""
}

public struct Retailer {
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
    public var paymentMethod: PaymentMethods = PaymentMethods()
    public var user: User = User()
    public var address: Address = Address()
    public var addressId: String = ""
    public var billingAddress: Address = Address()
    public var billingAddressId: String = ""
    public var sameDeliveryAndBillingAddress: Bool = false
    public var settings: PurchaserSettings = PurchaserSettings()
    public var createdAt: String = ""
    public var updatedAt: String = ""
}

public struct RetailerDataAttributes {
    public init() {}
    
    public var pos: String = ""
    public var venue: String = ""
    public var banking: String = ""
    public var accounting: String = ""
    public var tradingHours: TradingHours = TradingHours()
}

public struct PurchaserPaymentMethod {
    public init() {}
    
    public var bankConfigured: Bool = false
    public var cardConfigured: Bool = false
}

public struct PurchaserSettings {
    public init() {}
    
    public var brand: Brand = Brand()
    public var flags: [String] = []
    public var dayStart: String = ""
    public var insights: Insights = Insights()
    public var monthStart: String = ""
    public var weightType: String = ""
    public var orderPrefix: String = ""
    public var paymentTerms: PaymentTerms = PaymentTerms()
    public var randomWeight: Bool = false
    public var deliveryDelay: Int = 0
    public var groupPayments: Bool = false
    public var invoicePrefix: String = ""
    public var orderSchedule: String = ""
    public var paymentMethod: PaymentMethods = PaymentMethods()
    public var invoiceSetting: InvoiceSetting = InvoiceSetting()
    public var includeWeekends: Bool = false
    public var invoiceFrequency: InvoiceFrequency = InvoiceFrequency()
    public var defaultDeliveryDelay: String = ""
    public var defaultSalesAccountCode: String = ""
    public var includeOrderUpdatesInReports: Bool = false
}

public struct PurchaserProperties {
    public init() {}
    
    public var demoSupplier: Bool = false
    public var hasTerms: Bool = false
    public var setupComplete: Bool = false
    public var marketplacePurchaser: Bool = false
}

public struct PriceGroup {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
    public var supplierId: String = ""
    public var userId: String = ""
    public var single: Bool = false
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var deleted_at: String = ""
    public var supplier_id: String = ""
    public var user_id: String = ""
}

public struct VisibilityGroup {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
    public var supplierId: String = ""
    public var userId: String = ""
    public var single: Bool = false
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var deleted_at: String = ""
    public var supplier_id: String = ""
    public var user_id: String = ""
}

public struct FreightGroup {
    public init() {}
    
    public var id: String = ""
    public var name: String = ""
    public var type: String = ""
    public var cost: String = ""
    public var valueThreshold: String = ""
    public var quantityThreshold: String = ""
    public var active: Bool = false
    public var supplierId: String = ""
    public var userId: String = ""
    public var createdAt: String = ""
    public var updatedAt: String = ""
    public var deletedAt: String = ""
    public var created_at: String = ""
    public var updated_at: String = ""
    public var deleted_at: String = ""
    public var supplier_id: String = ""
    public var user_id: String = ""
}

public struct CreatePurchaserRequest: Codable {
    public init() {}
    
    public var supplierId: String = ""
    public var retailerId: String = ""
}

extension PurchaserResponse: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        meta = try container.decodeIfPresent(Meta.self, forKey: .meta) ?? Meta()
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links()
        data = try container.decodeIfPresent([Purchaser].self, forKey: .data) ?? []
    }
}

extension Purchaser: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        reference = try container.decodeIfPresent(String.self, forKey: .reference) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        retailerName = try container.decodeIfPresent(String.self, forKey: .retailerName) ?? ""
        retailerAlias = try container.decodeIfPresent(String.self, forKey: .retailerAlias) ?? ""
        retailerLegalName = try container.decodeIfPresent(String.self, forKey: .retailerLegalName) ?? ""
        retailerTradingName = try container.decodeIfPresent(String.self, forKey: .retailerTradingName) ?? ""
        retailerPhone = try container.decodeIfPresent(String.self, forKey: .retailerPhone) ?? ""
        retailerEmail = try container.decodeIfPresent(String.self, forKey: .retailerEmail) ?? ""
        retailerAddress = try container.decodeIfPresent(RetailerAddress.self, forKey: .retailerAddress) ?? RetailerAddress()
        billingAddress = try container.decodeIfPresent(Address.self, forKey: .billingAddress) ?? Address()
        retailerDataAttributes = try container.decodeIfPresent(RetailerDataAttributes.self, forKey: .retailerDataAttributes) ?? RetailerDataAttributes()
        retailerAddressLine = try container.decodeIfPresent(String.self, forKey: .retailerAddressLine) ?? ""
        billingAddressLine = try container.decodeIfPresent(String.self, forKey: .billingAddressLine) ?? ""
        retailerId = try container.decodeIfPresent(String.self, forKey: .retailerId) ?? ""
        retailer = try container.decodeIfPresent(Retailer.self, forKey: .retailer) ?? Retailer()
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        supplier = try container.decodeIfPresent(Supplier.self, forKey: .supplier) ?? Supplier()
        invoiceSetting = try container.decodeIfPresent(String.self, forKey: .invoiceSetting) ?? ""
        invoiceFrequency = try container.decodeIfPresent(String.self, forKey: .invoiceFrequency) ?? ""
        paymentTerms = try container.decodeIfPresent(String.self, forKey: .paymentTerms) ?? ""
        paymentDelay = try container.safeIntDecode(forKey: .paymentDelay) ?? 0
        paymentMethodTypes = try container.decodeIfPresent(PaymentMethodTypes.self, forKey: .paymentMethodTypes) ?? PaymentMethodTypes()
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        defaultPaymentMethodType = try container.decodeIfPresent(PaymentMethodType.self, forKey: .defaultPaymentMethodType) ?? PaymentMethodType()
        paymentMethod = try container.decodeIfPresent(PurchaserPaymentMethod.self, forKey: .paymentMethod) ?? PurchaserPaymentMethod()
        paymentSchedule = try container.decodeIfPresent(String.self, forKey: .paymentSchedule) ?? ""
        canCharge = try container.safeBoolDecode(forKey: .canCharge) ?? false
        freightGroupId = try container.decodeIfPresent(String.self, forKey: .freightGroupId) ?? ""
        freightGroup = try container.decodeIfPresent(FreightGroup.self, forKey: .freightGroup) ?? FreightGroup()
        visibilityGroupId = try container.decodeIfPresent(String.self, forKey: .visibilityGroupId) ?? ""
        visibilityGroup = try container.decodeIfPresent(VisibilityGroup.self, forKey: .visibilityGroup) ?? VisibilityGroup()
        priceGroupId = try container.decodeIfPresent(String.self, forKey: .priceGroupId) ?? ""
        priceGroup = try container.decodeIfPresent(PriceGroup.self, forKey: .priceGroup) ?? PriceGroup()
        stopCredit = try container.safeBoolDecode(forKey: .stopCredit) ?? false
        archived = try container.safeBoolDecode(forKey: .archived) ?? false
        minimumOrderValue = try container.safeFloatDecode(forKey: .minimumOrderValue) ?? 0
        disabled = try container.safeBoolDecode(forKey: .disabled) ?? false
        deliveryInstructions = try container.decodeIfPresent(String.self, forKey: .deliveryInstructions) ?? ""
        notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        schedules = try container.decodeIfPresent([Schedule].self, forKey: .schedules) ?? []
        externalCustomerId = try container.decodeIfPresent(String.self, forKey: .externalCustomerId) ?? ""
        properties = try container.decodeIfPresent(PurchaserProperties.self, forKey: .properties) ?? PurchaserProperties()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        orderedAt = try container.decodeIfPresent(String.self, forKey: .orderedAt) ?? ""
    }
}

extension PurchaserTerms: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        lastAgreed = try container.decodeIfPresent(String.self, forKey: .lastAgreed) ?? ""
        hasAgreed = try container.safeBoolDecode(forKey: .hasAgreed) ?? false
        agreementRequired = try container.safeBoolDecode(forKey: .agreementRequired) ?? false
    }
}

extension PaymentMethodTypes: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        value = try container.decodeIfPresent([String].self, forKey: .value) ?? []
        display = try container.decodeIfPresent(String.self, forKey: .display) ?? ""
    }
}

extension PaymentMethodType: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        display = try container.decodeIfPresent(String.self, forKey: .display) ?? ""
        value = try container.decodeIfPresent(String.self, forKey: .value) ?? ""
    }
}

extension Schedule: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}

extension RetailerAddress: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        street1 = try container.decodeIfPresent(String.self, forKey: .street1) ?? ""
        street2 = try container.decodeIfPresent(String.self, forKey: .street2) ?? ""
        suburb = try container.decodeIfPresent(String.self, forKey: .suburb) ?? ""
        state = try container.decodeIfPresent(String.self, forKey: .state) ?? ""
        postcode = try container.decodeIfPresent(String.self, forKey: .postcode) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}

extension Retailer: Decodable {
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
        paymentMethod = try container.decodeIfPresent(PaymentMethods.self, forKey: .paymentMethod) ?? PaymentMethods()
        user = try container.decodeIfPresent(User.self, forKey: .user) ?? User()
        address = try container.decodeIfPresent(Address.self, forKey: .address) ?? Address()
        addressId = try container.decodeIfPresent(String.self, forKey: .addressId) ?? ""
        billingAddress = try container.decodeIfPresent(Address.self, forKey: .billingAddress) ?? Address()
        billingAddressId = try container.decodeIfPresent(String.self, forKey: .billingAddressId) ?? ""
        sameDeliveryAndBillingAddress = try container.safeBoolDecode(forKey: .sameDeliveryAndBillingAddress) ?? false
        settings = try container.decodeIfPresent(PurchaserSettings.self, forKey: .settings) ?? PurchaserSettings()
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
    }
}

extension RetailerDataAttributes: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        pos = try container.decodeIfPresent(String.self, forKey: .pos) ?? ""
        venue = try container.decodeIfPresent(String.self, forKey: .venue) ?? ""
        banking = try container.decodeIfPresent(String.self, forKey: .banking) ?? ""
        accounting = try container.decodeIfPresent(String.self, forKey: .accounting) ?? ""
        tradingHours = try container.decodeIfPresent(TradingHours.self, forKey: .tradingHours) ?? TradingHours()
    }
}

extension PurchaserPaymentMethod: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        bankConfigured = try container.safeBoolDecode(forKey: .bankConfigured) ?? false
        cardConfigured = try container.safeBoolDecode(forKey: .cardConfigured) ?? false
    }
}

extension PurchaserSettings: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        brand = try container.decodeIfPresent(Brand.self, forKey: .brand) ?? Brand()
        flags = try container.decodeIfPresent([String].self, forKey: .flags) ?? []
        dayStart = try container.decodeIfPresent(String.self, forKey: .dayStart) ?? ""
        insights = try container.decodeIfPresent(Insights.self, forKey: .insights) ?? Insights()
        monthStart = try container.decodeIfPresent(String.self, forKey: .monthStart) ?? ""
        weightType = try container.decodeIfPresent(String.self, forKey: .weightType) ?? ""
        orderPrefix = try container.decodeIfPresent(String.self, forKey: .orderPrefix) ?? ""
        paymentTerms = try container.decodeIfPresent(PaymentTerms.self, forKey: .paymentTerms) ?? PaymentTerms()
        randomWeight = try container.safeBoolDecode(forKey: .randomWeight) ?? false
        deliveryDelay = try container.safeIntDecode(forKey: .deliveryDelay) ?? 0
        groupPayments = try container.safeBoolDecode(forKey: .groupPayments) ?? false
        invoicePrefix = try container.decodeIfPresent(String.self, forKey: .invoicePrefix) ?? ""
        orderSchedule = try container.decodeIfPresent(String.self, forKey: .orderSchedule) ?? ""
        paymentMethod = try container.decodeIfPresent(PaymentMethods.self, forKey: .paymentMethod) ?? PaymentMethods()
        invoiceSetting = try container.decodeIfPresent(InvoiceSetting.self, forKey: .invoiceSetting) ?? InvoiceSetting()
        includeWeekends = try container.safeBoolDecode(forKey: .includeWeekends) ?? false
        invoiceFrequency = try container.decodeIfPresent(InvoiceFrequency.self, forKey: .invoiceFrequency) ?? InvoiceFrequency()
        defaultDeliveryDelay = try container.decodeIfPresent(String.self, forKey: .defaultDeliveryDelay) ?? ""
        defaultSalesAccountCode = try container.decodeIfPresent(String.self, forKey: .defaultSalesAccountCode) ?? ""
        includeOrderUpdatesInReports = try container.safeBoolDecode(forKey: .includeOrderUpdatesInReports) ?? false
    }
}

extension PurchaserProperties: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        demoSupplier = try container.safeBoolDecode(forKey: .demoSupplier) ?? false
        hasTerms = try container.safeBoolDecode(forKey: .hasTerms) ?? false
        setupComplete = try container.safeBoolDecode(forKey: .setupComplete) ?? false
        marketplacePurchaser = try container.safeBoolDecode(forKey: .marketplacePurchaser) ?? false
    }
    
}

extension PriceGroup: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        single = try container.safeBoolDecode(forKey: .single) ?? false
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
        supplier_id = try container.decodeIfPresent(String.self, forKey: .supplier_id) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
    }
}

extension VisibilityGroup: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        single = try container.safeBoolDecode(forKey: .single) ?? false
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
        supplier_id = try container.decodeIfPresent(String.self, forKey: .supplier_id) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
    }
}

extension FreightGroup: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        cost = try container.decodeIfPresent(String.self, forKey: .cost) ?? ""
        valueThreshold = try container.decodeIfPresent(String.self, forKey: .valueThreshold) ?? ""
        quantityThreshold = try container.decodeIfPresent(String.self, forKey: .quantityThreshold) ?? ""
        active = try container.safeBoolDecode(forKey: .active) ?? false
        supplierId = try container.decodeIfPresent(String.self, forKey: .supplierId) ?? ""
        userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt) ?? ""
        created_at = try container.decodeIfPresent(String.self, forKey: .created_at) ?? ""
        updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at) ?? ""
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at) ?? ""
        supplier_id = try container.decodeIfPresent(String.self, forKey: .supplier_id) ?? ""
        user_id = try container.decodeIfPresent(String.self, forKey: .user_id) ?? ""
    }
}
