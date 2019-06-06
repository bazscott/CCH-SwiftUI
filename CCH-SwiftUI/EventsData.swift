import SwiftUI
import Combine

class EventsData: BindableObject {

    let didChange = PassthroughSubject<EventsData, Never>()

    var events = [CCHEvent]() {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }

    init() {
        #if DEBUG
        setupTestData()
        #endif
        fetchEvents()
    }

    private func fetchEvents() {
        EventRepository().fetchEvents { result in
            switch result {
            case .success(let eventData):
                self.events = eventData.sorted(by: { $0.startDate ?? Date.distantPast < $1.startDate ?? Date.distantPast })
            case .failure:
                print("Error fetching events data")
            }
        }
    }

    func setupTestData() {
        events = [
            CCHEvent(title: "Title 1", subtitle: "Subtitle 1", startDate: Date(), address: CCHAddress(display: "Location 1", location: CCHLocation(latitude: 100, longitude: 100)), links: nil),
            CCHEvent(title: "Title 2", subtitle: "Subtitle 2", startDate: Date(), address: CCHAddress(display: "Location 2", location: CCHLocation(latitude: 10, longitude: 10)), links: nil)
        ]
    }

}
