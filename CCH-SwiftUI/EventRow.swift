import SwiftUI

struct EventRow: View {

    let event: CCHEvent

    var body: some View {
        return NavigationButton(destination: EventDetail(event: event)) {
            EventInfoView(event: event)
        }
    }
    
}

#if DEBUG
struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: EventsData().events[0])
    }
}
#endif
