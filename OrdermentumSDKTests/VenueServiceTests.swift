//
//  VenueServiceTests.swift
//  OrdermentumSDKTests
//
//  Created by Joseph Fabian on 16/04/2019.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import XCTest
@testable import OrdermentumSDK

class VenueServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testGetVenues() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: VenueResponse = VenueResponse()
        requestObject.data = []
        requestObject.links = Links()
        requestObject.meta = Meta()
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        VenueService().getVenues(retailerIdsArray: [], pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testUpdateVenueProfile() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: VenueResponse = VenueResponse()
        requestObject.data = []
        requestObject.links = Links()
        requestObject.meta = Meta()
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        VenueService().updateVenueProfile(retailerIdsArray: [], pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetProfileCompletion() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: Completion = Completion()
        requestObject.profilePercent = 1
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        VenueService().getProfileCompletion(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "") { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testSendVenueInvite() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: AddUser = AddUser()
        requestObject.senderId = ProcessInfo.processInfo.environment["SENDER_ID"] ?? ""
        requestObject.senderType = ProcessInfo.processInfo.environment["SENDER_TYPE"] ?? ""
        requestObject.senderEntityName = ProcessInfo.processInfo.environment["SENDER_ENTITY_NAME"] ?? ""
        requestObject.recipientEntityType = ProcessInfo.processInfo.environment["RECIPIENT_ENTITY_TYPE"] ?? ""
        requestObject.recipientEntityId = ProcessInfo.processInfo.environment["RECIPIENT_ENTITY_ID"] ?? ""
        requestObject.recipientEmail = ProcessInfo.processInfo.environment["RECIPIENT_EMAIL"] ?? ""
        requestObject.recipientFirstName = ProcessInfo.processInfo.environment["RECIPIENT_FIRSTNAME"] ?? ""
        requestObject.recipientLastName = ProcessInfo.processInfo.environment["RECIPIENT_LASTNAME"] ?? ""
        requestObject.role = ProcessInfo.processInfo.environment["ROLE"] ?? ""
        requestObject.inviteType = ProcessInfo.processInfo.environment["INVITE_TYPE"] ?? ""

        var responseData: AddUserResponse = AddUserResponse()
        responseData.id = ProcessInfo.processInfo.environment["ID"] ?? ""
        responseData.senderEntityName = ProcessInfo.processInfo.environment["SENDER_ENTITY_NAME"] ?? ""
        responseData.senderId = ProcessInfo.processInfo.environment["SENDER_ID"] ?? ""
        responseData.recipientFirstName = ProcessInfo.processInfo.environment["RECEPIENT_FIRST_NAME"] ?? ""
        responseData.recipientLastName = ProcessInfo.processInfo.environment["RECEPIENT_LAST_NAME"] ?? ""
        responseData.recipientFullName = ProcessInfo.processInfo.environment["RECEPIENT_FULL_NAME"] ?? ""
        responseData.recipientPhone = ProcessInfo.processInfo.environment["RECEPIENT_PHONE"] ?? ""
        responseData.recipientEntityName = ProcessInfo.processInfo.environment["RECEPIENT_ENTITY_NAME"] ?? ""
        responseData.referenceId = ProcessInfo.processInfo.environment["RECEPIENT_REFERENCE_ID"] ?? ""
        responseData.status = ProcessInfo.processInfo.environment["RECEPIENT_STATUS"] ?? ""
        responseData.permissions = []
        responseData.isApproved = true
        responseData.approvedByName = ProcessInfo.processInfo.environment["APPROVED_BY_NAME"] ?? ""
        responseData.createdAt = ProcessInfo.processInfo.environment["CREATED_AT"] ?? ""
        responseData.createdByName = ProcessInfo.processInfo.environment["CREATED_BY_NAME"] ?? ""
        responseData.updatedAt = ProcessInfo.processInfo.environment["UPDATED_AT"] ?? ""
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        VenueService().sendVenueInvite(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
    }

    func testGetUsers() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var responseData: VenueUsersResponse = VenueUsersResponse()
        responseData.data = []
        responseData.links = Links()
        responseData.meta = Meta()
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        VenueService().getUsers(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "") { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testRemoveUser() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var responseObject: RemoveUser = RemoveUser()
        responseObject.entityId = ProcessInfo.processInfo.environment["ENTITY_ID"] ?? ""
        responseObject.perms = []

        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""

        VenueService().removeUser(userId: ProcessInfo.processInfo.environment["USER_ID"] ?? "", requestObject: responseObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
    }
}
