import SwiftUI
import CoreLocation

struct CCHEvent: Hashable, Codable, Identifiable {

    let id = UUID()
    let title: String
    let subtitle: String?
    let startDate: Date?
    let address: CCHAddress?
    let links: CCHLinks?

    var addressCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: address?.location.latitude ?? 0,
            longitude: address?.location.longitude ?? 0)
    }
}

struct CCHAddress: Hashable, Codable {
    let display: String
    let location: CCHLocation
}

struct CCHLocation: Hashable, Codable {
    let latitude: Double
    let longitude: Double
}

struct CCHLinks: Hashable, Codable {
    let tickets: String
    let location: String
    let selfLink: String
    let web: String

    enum CodingKeys: String, CodingKey {
        case tickets
        case location
        case selfLink = "self"
        case web
    }
}

struct CCHEventsPage: Hashable, Codable {
    let data: [CCHEvent]
}
