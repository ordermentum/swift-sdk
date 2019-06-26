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
        
        Client.instance.venues.getVenues(retailerIdsArray: [], pageSize: 10, pageNo: 1) { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testCreateVenue() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        var requestObject: CreateVenueRequest = CreateVenueRequest()
        requestObject.legalName = ProcessInfo.processInfo.environment["CREATE_VENUE_LEGALNAME"] ?? ""
        requestObject.tradingName = ProcessInfo.processInfo.environment["CREATE_VENUE_TRADINGNAME"] ?? ""
        requestObject.userId = ProcessInfo.processInfo.environment["CREATE_VENUE_USERID"] ?? ""
        requestObject.ownerId = ProcessInfo.processInfo.environment["CREATE_VENUE_OWNERID"] ?? ""
        requestObject.phone = ProcessInfo.processInfo.environment["CREATE_VENUE_PHONE"] ?? ""
        requestObject.email = ProcessInfo.processInfo.environment["CREATE_VENUE_EMAIL"] ?? ""
        requestObject.address = ProcessInfo.processInfo.environment["CREATE_VENUE_ADDRESS"] ?? ""
        requestObject.abn = ProcessInfo.processInfo.environment["CREATE_VENUE_ABN"] ?? ""
        requestObject.contactFirstName = ProcessInfo.processInfo.environment["CREATE_VENUE_CONTACT_FIRSTNAME"] ?? ""
        requestObject.contactLastName = ProcessInfo.processInfo.environment["CREATE_VENUE_CONTACT_LASTNAME"] ?? ""
        requestObject.contactEmail = ProcessInfo.processInfo.environment["CREATE_VENUE_CONTACT_EMAIL"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? VenueRouter.createVenue(requestObject).asURLRequest() {
            self.startStub(route, stubData: .createVenue )
        }
        
        //Call API
        Client.instance.venues.createVenues(requestObject, completion: { (result, responseData) in
            assert(result)
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testSearchVenue() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let searchQuery = ProcessInfo.processInfo.environment["VENUE_SEARCH_QUERY"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? VenueRouter.searchVenue(searchQuery).asURLRequest() {
            self.startStub(route, stubData: .searchVenues )
        }
        
        //Call API
        Client.instance.venues.searchVenues(searchQuery: searchQuery) { (success, responseData) in
            assert(success)
            XCTAssertNotNil(responseData)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func skipped_testUpdateVenueProfile() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: VenueResponse = VenueResponse()
        requestObject.data = []
        requestObject.links = Links()
        requestObject.meta = Meta()
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
//        Client.instance.venues.updateVenueProfile(retailerIdsArray: [], pageSize: 10, pageNo: 1) { (result, requestObject) in
//            assert(result)
//            expectation.fulfill()
//        }
    }
    
    func testGetProfileCompletion() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        var requestObject: Completion = Completion()
        requestObject.profilePercent = 1
        
        //Call API
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        Client.instance.venues.getProfileCompletion(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "") { (result, requestObject) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testGetVenueInvites() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        let recipientEmail = ProcessInfo.processInfo.environment["RECIPIENT_EMAIL"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? VenueRouter.getVenueInvites(recipientEmail).asURLRequest() {
            self.startStub(route, stubData: .getVenueInvites )
        }
        
        //Call API
        Client.instance.venues.checkVenueInvites(recipientEmail) { (success, response) in
            assert(success)
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
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
        
        Client.instance.venues.sendVenueInvite(requestObject) { (result, responseData) in
            assert(result)
            expectation.fulfill()
        }
    }
    
    func testAcceptAllInvites() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? VenueRouter.acceptAllInvites.asURLRequest() {
            self.startStub(route, stubData: .acceptAllInvites )
        }
        
        //Call API
        Client.instance.venues.acceptAllInvites { (success) in
            assert(success)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testJoinVenue() {
        //Build Expectation
        let expectation = XCTestExpectation(description: "Async Test")
        
        //Build request body and params
        var requestBody = JoinVenueRequest()
        requestBody.recipientEntityId = ProcessInfo.processInfo.environment["RECIPIENT_VENUE_ID"] ?? ""
        requestBody.userId = ProcessInfo.processInfo.environment["USER_ID"] ?? ""
        
        //Request setup
        Client.instance.baseURL = ClientURL.rootTestingURL
        Client.instance.token = ProcessInfo.processInfo.environment["ACCESS_TOKEN"] ?? ""
        
        //Stubbing
        if let route = try? VenueRouter.joinVenue(requestBody).asURLRequest() {
            self.startStub(route, stubData: .joinVenue )
        }
        
        //Call API
        Client.instance.venues.joinVenue(requestBody) { (success) in
            assert(success)
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
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
        
        Client.instance.venues.getUsers(retailerId: ProcessInfo.processInfo.environment["RETAILER_ID"] ?? "") { (result, responseData) in
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
        
        Client.instance.venues.removeUser(userId: ProcessInfo.processInfo.environment["USER_ID"] ?? "", requestObject: responseObject) { (result) in
            assert(result)
            expectation.fulfill()
        }
    }
}
