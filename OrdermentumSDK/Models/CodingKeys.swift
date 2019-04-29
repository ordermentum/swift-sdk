//
//  CodingKeys.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 12/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

enum CodingKeys: String, CodingKey {
    // Main
    case meta
    case links
    case data
    
    // Meta
    case totalResults
    case totalPages
    case pageSize
    case pageNo
    
    //Links
    case linksSelf = "self"
    case first
    case next
    case prev
    case last
    
    //Image
    case secure_url
    case original
    case logo
    case icon
    case print
    case mini
    case small
    case medium
    case large
    
    //Flags
    case findSupplier = "find-supplier"
    case review
    case dashboardProfile = "dashboard_profile"
    case userInvite = "user-invite"
    case popularProducts = "popular-products"
    case addons = "add-ons"
    case homePopularProducts = "home-popular-products"
    case retailerSignup = "retailer-signup"
    case addVenue = "add-venue"
    case projectionsV2 = "projections-v2"
    
    //Generic
    case abn
    case accessNewRetailerUi
    case account
    case accountId
    case accounting
    case accountName
    case accountSettings
    case active
    case activeRetailerIds
    case activityEnded
    case address
    case addressableId
    case addressableType
    case addressId
    case address_id
    case addTax
    case admin
    case adminPerms
    case alerts
    case alias
    case approvedByName
    case attacheXml
    case bankConfigured
    case banking
    case batchCode
    case billingAddress
    case billingAddressId
    case billingAddressLine
    case billingEnd
    case billingEndDate
    case billingStart
    case billingStartDate
    case brand
    case brandImages
    case bsb
    case byhour
    case byminute
    case cancelled
    case cancelledAt
    case cancelledByName
    case canCharge
    case canMarkAsPaid
    case canMarkAsUnpaid
    case cardConfigured
    case cardLast4Digits
    case cardName
    case cardType
    case cart
    case cartErrorCount
    case cartInfoCount
    case cartWarningCount
    case categories
    case chargable
    case chargedAt
    case chargedBy
    case chargedByUser
    case chargedByUserId
    case charged_by_user_id
    case classicStandingOrders
    case closeHour
    case closeMinute
    case code
    case color
    case comment
    case comments
    case completeAt
    case completedAt
    case connect
    case connectUrl
    case contactEmail
    case contactFirstName
    case contactLastName
    case corporateEntity
    case cost
    case country
    case createdAt
    case createdBy
    case createdByName
    case created_at
    case creation
    case credit
    case creditCard
    case creditNoteIds
    case customers
    case cutoff
    case cutOffPassed
    case cutOffTime
    case daily
    case dataAttributes
    case date
    case days
    case dayStart
    case defaultDeliveryDelay
    case defaultNotifications
    case defaultPaymentMethodType
    case defaultSalesAccountCode
    case defaultSchedule
    case deletedAt
    case deleted_at
    case deliveries
    case delivery
    case deliveryAt
    case deliveryDate
    case deliveryDays
    case deliveryDelay
    case deliveryInstructions
    case demoSupplier
    case description
    case directDebit
    case directProcessing
    case disabled
    case disconnectUrl
    case display
    case displayName
    case displayUOM
    case dob
    case dueAt
    case editable
    case editableUntil
    case email
    case enabled
    case enableDeliveryDate
    case enableEmail
    case enableSMS
    case endDate
    case endOfMonth
    case endOfWeek
    case entityName
    case entityNotifications
    case entityType
    case errors
    case escalationTime
    case expenseAccountCode
    case experimentId
    case externalCustomerId
    case externalId
    case fileType
    case firstName
    case firstReminder
    case flags
    case format
    case formatted
    case formattedPrice
    case fortnightly
    case freight
    case freightGroup
    case freightGroupId
    case freq
    case frequency
    case fri
    case fullName
    case globalBakeXml
    case groupPayments
    case gst
    case height
    case id
    case images
    case includeOrderUpdatesInReports
    case includeWeekends
    case insights
    case integrationData
    case interval
    case invoice
    case invoiceEmailDelay
    case invoiceFrequency
    case invoiceId
    case invoiceIds
    case invoiceNumber
    case invoicePrefix
    case invoiceReference
    case invoiceSendAt
    case invoiceSentAt
    case invoiceSetting
    case invoiceStatus
    case invoiceSyncedAt
    case isAdmin
    case isApproved
    case isCancellable
    case isCancelled
    case isCard
    case isDirect
    case isEditable
    case isLocked
    case isOpen
    case isOutstanding
    case isReinstatable
    case isRetailerEditable
    case isSuperAdmin
    case label
    case lastFinishedAt
    case lastInvoiceSyncedAt
    case lastName
    case lastStartedAt
    case latitude
    case leadTime
    case legalName
    case lineItemErrorCount
    case lineItemInfosCount
    case lineItems
    case lineItemWarningCount
    case link
    case liquorLicense
    case liquorLicenseRequired
    case live
    case locked
    case longitude
    case looseCount
    case maskedNumber
    case message
    case minimumOrderValue
    case minQuantity
    case mon
    case monthly
    case monthStart
    case mostOrdered
    case name
    case nextFinishAt
    case nextRun
    case nextRunAt
    case nextRunCancelled
    case nextRunDate
    case noPaymentActions
    case notes
    case notifications
    case number
    case onPlace
    case openHour
    case openMinute
    case orderedAt
    case orderExports
    case orderId
    case ordermentum
    case orderNumber
    case orderPrefix
    case orders
    case orderSchedule
    case ordersCsv
    case ordersDeliveryManifestPdf
    case ordersDeliveryPdf
    case ordersDeliverySummaryPdf
    case ordersInvoicePdf
    case ordersLineItemsCsv
    case ordersLineItemsDetailsCsv
    case ordersPickPdf
    case ordersProductionCsv
    case ordersProductionReportPdf
    case orderStatus
    case origin
    case other
    case overdueOrders
    case packCount
    case paidAt
    case paidSupplierAt
    case paidToSupplier
    case parentNotifications
    case passwordResetSentAt
    case passwordResetToken
    case payable
    case paymentDelay
    case paymentMethod
    case paymentMethodId
    case paymentMethodType
    case paymentMethodTypes
    case paymentRecurrence
    case paymentSchedule
    case paymentStatus
    case paymentTerms
    case paymentTransactionId
    case permissions
    case phone
    case place
    case placedAt
    case placedById
    case placedByName
    case placedOrders
    case plan
    case pos
    case postcode
    case price
    case priceFromTotal
    case priceGroup
    case priceGroupId
    case priceInc
    case processing
    case processingError
    case product
    case productCategories
    case productCount
    case productExports
    case productId
    case productsCsv
    case profileImage
    case profilePercent
    case projections
    case properties
    case public_id
    case purchaserId
    case purchaserName
    case purchaserScheduleId
    case purchaser_id
    case pushNotifications
    case quantity
    case quantityThreshold
    case randomWeight
    case ratePrice
    case readUrl
    case recipientEmail
    case recipientEntityName
    case recipientFirstName
    case recipientFullName
    case recipientLastName
    case recipientPhone
    case reckonReport
    case recurrence
    case recurrenceInfo
    case reference
    case referenceId
    case remindedAt
    case remittance
    case resource_type
    case restart
    case retailer
    case retailerAddress
    case retailerAddressLine
    case retailerAlias
    case retailerChargeable
    case retailerDataAttributes
    case retailerEditable
    case retailerEmail
    case retailerExports
    case retailerId
    case retailerLegalName
    case retailerName
    case retailerPhone
    case retailers
    case retailerTradingName
    case retailer_id
    case role
    case roles
    case runAt
    case runStatus
    case sameDeliveryAndBillingAddress
    case sat
    case schedule
    case scheduleEnabled
    case scheduleId
    case scheduleName
    case schedules
    case senderEntityName
    case senderId
    case senderType
    case sendInvoice
    case sentLateNotificationAt
    case sentOverdueNotificationAt
    case sequence
    case settings
    case settlementReference
    case sharedSecret
    case shortName
    case show
    case signature
    case single
    case SKU
    case slot
    case slug
    case sortOrder
    case standingOrders
    case startDate
    case state
    case status
    case stopCredit
    case street1
    case street2
    case submittedAt
    case subtext
    case subtotal
    case suburb
    case sun
    case superAdmin
    case supplier
    case supplierId
    case supplierName
    case suppliers
    case supplier_id
    case survey_scheduled_at
    case syncError
    case tax
    case taxable
    case thu
    case timezone
    case timeZone
    case title
    case total
    case totalCost
    case totalDue
    case totalFreight
    case totalFreightIncGST
    case totalFreightTax
    case totalGST
    case totalPaid
    case totalQuantity
    case totalWeight
    case tradingHours
    case tradingName
    case trending
    case token
    case tue
    case type
    case unit
    case unitPrice
    case unitSize
    case uom
    case updatedAt
    case updatedBy
    case updatedById
    case updatedByName
    case updatedUserId
    case updated_at
    case updated_by_id
    case updateUrl
    case url
    case user
    case userId
    case user_id
    case value
    case valueThreshold
    case venue
    case venueTypes
    case verifiedAt
    case version
    case visibilityGroup
    case visibilityGroupId
    case visible
    case wed
    case weekly
    case weight
    case weightType
    case width
}
