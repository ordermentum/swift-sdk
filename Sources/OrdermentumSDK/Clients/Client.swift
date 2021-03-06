//
//  Client.swift
//  ordermentum-swift-sdk
//
//  Created by Brandon Stillitano on 4/4/19.
//  Copyright © 2019 Ordermentum. All rights reserved.
//

import Foundation
import Alamofire

public class Client {
    //Data
    public var baseURL: String = ""
    public var token: String = ""
    public var headers: [String: String] = [:]

    //Private Init to Stop Re-Initialisation
    private init() { }
    public static let instance = Client()

    //Services
    public var admin: AdminService = AdminService()
    public var addons: AddOnsService = AddOnsService()
    public var auth: AuthService = AuthService()
    public var closureDates: ClosureDatesService = ClosureDatesService()
    public var creditNotes: CreditNotesService = CreditNotesService()
    public var dataAttributes: DataAttributesService = DataAttributesService()
    public var devices: DeviceService = DeviceService()
    public var findSuppliers: FindSupplierService = FindSupplierService()
    public var invoices: InvoiceService = InvoiceService()
    public var marketplaces: MarketplaceService = MarketplaceService()
    public var notifications: NotificationsService = NotificationsService()
    public var notify: NotifyService = NotifyService()
    public var nps: NPSService = NPSService()
    public var orders: OrdersService = OrdersService()
    public var payments: PaymentsService = PaymentsService()
    public var products: ProductsService = ProductsService()
    public var profiles: ProfileService = ProfileService()
    public var projections: ProjectionsService = ProjectionsService()
    public var purchasers: PurchaserService = PurchaserService()
    public var recommendedSuppliers: RecommendedSuppliersService = RecommendedSuppliersService()
    public var validation: ValidationService = ValidationService()
    public var venues: VenueService = VenueService()

    // MARK: Convenience Methods
    public func getHeaderToken() -> String {
        return String(format: "Bearer \(token)")
    }

    public func urlRequest(path: String, method: HTTPMethod, parameters: Parameters, body: Codable?, timeout: Int = 10) throws -> URLRequest {
        //Setup Data
        let url = try baseURL.asURL()
        let timeoutSeconds: Int = timeout

        //Build Request
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(timeoutSeconds * 1000)
        request.httpBody = body?.toJSONData()
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        //Set Headers
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }

        //Set Token
        if !token.isEmpty {
            request.setValue(getHeaderToken(), forHTTPHeaderField: "Authorization")
        }

        //Set Conditional Body
        return try URLEncoding(destination: .queryString,
                               arrayEncoding: .brackets,
                               boolEncoding: .literal).encode(request, with: parameters.filter { $0.value != nil })
    }
}

public enum ClientURL {
    public static let rootURL = "https://app.ordermentum.com/"
    public static let rootWebURL = "https://app.ordermentum.com/"
    public static let rootTestingURL = "https://app.ordermentum-sandbox.com/"
    public static let rootTestingWebURL = "https://app.ordermentum-sandbox.com/"
    public static let rootStaticURL = "https://static.ordermentum.com/"
}
