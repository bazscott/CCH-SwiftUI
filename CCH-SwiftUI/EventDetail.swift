import SwiftUI

struct EventDetail : View {

    let event: CCHEvent

    var body: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: event.addressCoordinate, pinTitle: event.address?.display ?? "Here")
                .edgesIgnoringSafeArea(.top)

            EventInfoView(event: event)

            EventLinksView(event: event)
            
            Spacer()
        }
    }
}

#if DEBUG
struct EventDetail_Previews : PreviewProvider {
    static var previews: some View {
        EventDetail(event: EventsData().events[0])
    }
}
#endif
