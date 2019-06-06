import SwiftUI

struct EventList: View {

    @State var eventsData = EventsData()

    var body: some View {
        NavigationView {
            List(eventsData.events) { event in
                EventRow(event: event)
            }
            .navigationBarTitle(Text("Upcoming events"))
        }
    }

}


#if DEBUG
struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(eventsData: EventsData())
    }
}
#endif
