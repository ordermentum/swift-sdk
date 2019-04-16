//
//  Purchaser.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 14/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

public struct PurchaserResponse {
    var meta: Meta = Meta()
    var links: Links = Links()
    var data: [Purchaser] = []
}

public struct Purchaser {
    var id: String = ""
    var reference: String = ""
    var name: String = ""
    var retailerName: String = ""
    var retailerAlias: String = ""
    var retailerLegalName: String = ""
    var retailerTradingName: String = ""
    var retailerPhone: String = ""
    var retailerEmail: String = ""
    var retailerAddress: RetailerAddress = RetailerAddress()
    var billingAddress: Address = Address()
    var retailerDataAttributes: RetailerDataAttributes = RetailerDataAttributes()
    var retailerAddressLine: String = ""
    var billingAddressLine: String = ""
    var retailerId: String = ""
    var retailer: Retailer = Retailer()
    var supplierId: String = ""
    var supplier: Supplier = Supplier()
    var invoiceSetting: String = ""
    var invoiceFrequency: String = ""
    var paymentTerms: String = ""
    var paymentDelay: Int = 0
    var paymentMethodTypes: PaymentMethodTypes = PaymentMethodTypes()
    var paymentMethodId: String?
    var defaultPaymentMethodType: PaymentMethodType = PaymentMethodType()
    var paymentMethod: PurchaserPaymentMethod = PurchaserPaymentMethod()
    var paymentSchedule: String = ""
    var canCharge: Bool = false
    var freightGroupId: String = ""
    var freightGroup: FreightGroup = FreightGroup()
    var visibilityGroupId: String = ""
    var visibilityGroup: VisibilityGroup = VisibilityGroup()
    var priceGroupId: String = ""
    var priceGroup: PriceGroup = PriceGroup()
    var stopCredit: Bool = false
    var minimumOrderValue: Int = 0
    var disabled: Bool = false
    var deliveryInstructions: String = ""
    var notes: String = ""
    var schedules: [Schedule] = []
    var externalCustomerId: String = ""
    var properties: PurchaserProperties = PurchaserProperties()
    var createdAt: String = ""
    var updatedAt: String = ""
    var orderedAt: String = ""
}

public struct PaymentMethodTypes {
    var value: [String] = []
    var display: String = ""
}

public struct PaymentMethodType: Encodable {
    var display: String = ""
    var value: String = ""
}

public struct Schedule {
    var id: String = ""
    var name: String = ""
}

public struct RetailerAddress {
    var number: String = ""
    var street1: String = ""
    var street2: String = ""
    var suburb: String = ""
    var state: String = ""
    var postcode: String = ""
    var country: String = ""
    var description: String = ""
    var type: String = ""
}

public struct Retailer {
    var id: String = ""
    var name: String = ""
    var legalName: String = ""
    var tradingName: String = ""
    var email: String = ""
    var phone: String = ""
    var dataAttributes: DataAttributes = DataAttributes()
    var liquorLicense: String = ""
    var abn: String = ""
    var paymentMethod: PaymentMethods = PaymentMethods()
    var user: User = User()
    var address: Address = Address()
    var addressId: String = ""
    var billingAddress: Address = Address()
    var billingAddressId: String = ""
    var sameDeliveryAndBillingAddress: Bool = false
    var settings: PurchaserSettings = PurchaserSettings()
    var createdAt: String = ""
    var updatedAt: String = ""
}

public struct RetailerDataAttributes {
    var pos: String = ""
    var venue: String = ""
    var banking: String = ""
    var accounting: String = ""
    var tradingHours: TradingHours = TradingHours()
}

public struct PurchaserPaymentMethod {
    var bankConfigured: Bool = false
    var cardConfigured: Bool = false
}

public struct PurchaserSettings {
    var brand: Brand = Brand()
    var flags: [String] = []
    var dayStart: String = ""
    var insights: Insights = Insights()
    var monthStart: String = ""
    var weightType: String = ""
    var orderPrefix: String = ""
    var paymentTerms: PaymentTerms = PaymentTerms()
    var randomWeight: Bool = false
    var deliveryDelay: Int = 0
    var groupPayments: Bool = false
    var invoicePrefix: String = ""
    var orderSchedule: String = ""
    var paymentMethod: PaymentMethods = PaymentMethods()
    var invoiceSetting: InvoiceSetting = InvoiceSetting()
    var includeWeekends: Bool = false
    var invoiceFrequency: InvoiceFrequency = InvoiceFrequency()
    var defaultDeliveryDelay: String = ""
    var defaultSalesAccountCode: String = ""
    var includeOrderUpdatesInReports: Bool = false
}

public struct PurchaserProperties {
    var demoSupplier: Bool = false
}

public struct PriceGroup {
    var id: String = ""
    var name: String = ""
    var supplierId: String = ""
    var userId: String = ""
    var single: Bool = false
    var createdAt: String = ""
    var updatedAt: String = ""
    var deletedAt: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var deleted_at: String = ""
    var supplier_id: String = ""
    var user_id: String = ""
}

public struct VisibilityGroup {
    var id: String = ""
    var name: String = ""
    var supplierId: String = ""
    var userId: String = ""
    var single: Bool = false
    var createdAt: String = ""
    var updatedAt: String = ""
    var deletedAt: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var deleted_at: String = ""
    var supplier_id: String = ""
    var user_id: String = ""
}

public struct FreightGroup {
    var id: String = ""
    var name: String = ""
    var type: String = ""
    var cost: String = ""
    var valueThreshold: String = ""
    var quantityThreshold: String = ""
    var active: Bool = false
    var supplierId: String = ""
    var userId: String = ""
    var createdAt: String = ""
    var updatedAt: String = ""
    var deletedAt: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    var deleted_at: String = ""
    var supplier_id: String = ""
    var user_id: String = ""
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
        paymentDelay = try container.decodeIfPresent(Int.self, forKey: .paymentDelay) ?? 0
        paymentMethodTypes = try container.decodeIfPresent(PaymentMethodTypes.self, forKey: .paymentMethodTypes) ?? PaymentMethodTypes()
        paymentMethodId = try container.decodeIfPresent(String.self, forKey: .paymentMethodId) ?? ""
        defaultPaymentMethodType = try container.decodeIfPresent(PaymentMethodType.self, forKey: .defaultPaymentMethodType) ?? PaymentMethodType()
        paymentMethod = try container.decodeIfPresent(PurchaserPaymentMethod.self, forKey: .paymentMethod) ?? PurchaserPaymentMethod()
        paymentSchedule = try container.decodeIfPresent(String.self, forKey: .paymentSchedule) ?? ""
        canCharge = try container.decodeIfPresent(Bool.self, forKey: .canCharge) ?? false
        freightGroupId = try container.decodeIfPresent(String.self, forKey: .freightGroupId) ?? ""
        freightGroup = try container.decodeIfPresent(FreightGroup.self, forKey: .freightGroup) ?? FreightGroup()
        visibilityGroupId = try container.decodeIfPresent(String.self, forKey: .visibilityGroupId) ?? ""
        visibilityGroup = try container.decodeIfPresent(VisibilityGroup.self, forKey: .visibilityGroup) ?? VisibilityGroup()
        priceGroupId = try container.decodeIfPresent(String.self, forKey: .priceGroupId) ?? ""
        priceGroup = try container.decodeIfPresent(PriceGroup.self, forKey: .priceGroup) ?? PriceGroup()
        stopCredit = try container.decodeIfPresent(Bool.self, forKey: .stopCredit) ?? false
        minimumOrderValue = try container.decodeIfPresent(Int.self, forKey: .minimumOrderValue) ?? 0
        disabled = try container.decodeIfPresent(Bool.self, forKey: .disabled) ?? false
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
        sameDeliveryAndBillingAddress = try container.decodeIfPresent(Bool.self, forKey: .sameDeliveryAndBillingAddress) ?? false
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
        bankConfigured = try container.decodeIfPresent(Bool.self, forKey: .bankConfigured) ?? false
        cardConfigured = try container.decodeIfPresent(Bool.self, forKey: .cardConfigured) ?? false
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
        randomWeight = try container.decodeIfPresent(Bool.self, forKey: .randomWeight) ?? false
        deliveryDelay = try container.decodeIfPresent(Int.self, forKey: .deliveryDelay) ?? 0
        groupPayments = try container.decodeIfPresent(Bool.self, forKey: .groupPayments) ?? false
        invoicePrefix = try container.decodeIfPresent(String.self, forKey: .invoicePrefix) ?? ""
        orderSchedule = try container.decodeIfPresent(String.self, forKey: .orderSchedule) ?? ""
        paymentMethod = try container.decodeIfPresent(PaymentMethods.self, forKey: .paymentMethod) ?? PaymentMethods()
        invoiceSetting = try container.decodeIfPresent(InvoiceSetting.self, forKey: .invoiceSetting) ?? InvoiceSetting()
        includeWeekends = try container.decodeIfPresent(Bool.self, forKey: .includeWeekends) ?? false
        invoiceFrequency = try container.decodeIfPresent(InvoiceFrequency.self, forKey: .invoiceFrequency) ?? InvoiceFrequency()
        defaultDeliveryDelay = try container.decodeIfPresent(String.self, forKey: .defaultDeliveryDelay) ?? ""
        defaultSalesAccountCode = try container.decodeIfPresent(String.self, forKey: .defaultSalesAccountCode) ?? ""
        includeOrderUpdatesInReports = try container.decodeIfPresent(Bool.self, forKey: .includeOrderUpdatesInReports) ?? false
    }
}

extension PurchaserProperties: Decodable {
    public init(from decoder: Decoder) throws {
        //Create Container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode Data
        demoSupplier = try container.decodeIfPresent(Bool.self, forKey: .demoSupplier) ?? false
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
        single = try container.decodeIfPresent(Bool.self, forKey: .single) ?? false
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
        single = try container.decodeIfPresent(Bool.self, forKey: .single) ?? false
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
        active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? false
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
