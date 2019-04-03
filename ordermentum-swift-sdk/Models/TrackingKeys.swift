//
//  TrackingKeys.swift
//  Ordermentum
//
//  Created by Brandon Stillitano on 18/3/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation

enum ActionTrackingStatusKey: String {
    case success
    case failed
}

enum ActionTrackingKey: String {
    // Generic actions
    case loggedIn = "Logged In"
    case selected = "Selected"
    
    // App specific actions
    case addCart = "Add Cart"
    case removeCart = "Remove Cart"
    case updateCart = "Update Cart"
    case addOrderFavorites = "Add Order Favorites"
    case deliveryDate = "Delivery Date"
    case selectedSupplier = "Selected Supplier"
    case orderedProducts = "Ordered Products"
    case popularProductClicked = "POPULAR_PRODUCT_CLICKED"
    case addedPopularProduct = "POPULAR_PRODUCT_ADDED"
    
    case experimentClicked = "EXPERIMENT_CLICKED"
}

enum ScreenTrackingKey: String {
    case dashboard
    case home
    case orders
    case history
    case settings
    case editProfile = "Edit Profile"
    case changePassword = "Change Password"
    
    case venueProfileDetails = "Venue Profile Details"
    case venueProfileHours = "Venue Profile Hours"
    case venueProfileOperations = "Venue Profile Operations"
    
    case payments
    case paymentMethodDetails = "Payment Method Details"
    case addCard = "Add Card"
    case addDirectDebit = "Add Direct Debit"
    
    case supplierNotifications = "Supplier Notifications"
    
    case productCategories = "Product Categories"
    case productsList = "Products List"
    case productDetails = "Products Details"
    
    case findSupplierSearch = "Find Supplier Search"
    case findSupplierDetails = "Find Supplier Details"
    case findSupplierRefer = "Find Supplier Refer"
    case findSupplierReferSuccess = "Find Supplier Refer Success"
    case findSupplierSuccess = "Find Supplier Success"
    
    case notifications
    case notificationsSupplier = "Supplier Notification Settings"
    case checkout
    case productUpdateCart = "Product Update Cart"
    case orderComments = "Order Comments"
    case orderPONumber = "Order Add PO Number"
    case orderSuccess = "Order Success"
    
    case adminRedirect = "Admin Redirect"
    case supplierRedirect = "Supplier Redirect"
    
    case favourites
    case favouriteDetails = "Favourite Details"
    case favouriteProductSearch = "Favourite Product Search"
    case favouriteProductDetails = "Favourite Product Details"
    
    case pushPermission = "Push Permission"
    case login
    case learnMore = "Learn More"
    case onboarding
    
    case createOrder = "Create Order"
    case createOrderProductSearch = "Create Order Product Search"
    case createOrderProductDetails = "Create Order Product Details"
    case orderDetails = "Order Details"
    
    case updateOrder = "Update Order"
    case updateOrderProductSearch = "Update Order Product Search"
    case updateOrderProductDetails = "Update Order Product Details"
    
    case searchResults = "Search Results"
    
    case npsRating = "NPS Rating"
    case npsComment = "NPS Comment"
    
    case invoiceDetails = "Invoice Details"
    
    case creditNoteDetails = "Credit Note Details"
}
