import SwiftUI

struct EventLinksView : View {

    let event: CCHEvent

    var body: some View {
        return VStack(alignment: .leading) {
            Text("Tickets")
                .font(.headline)
            HStack {
                Image(systemName: "link")
                Text(event.links?.tickets ?? "Not available")
                    .font(.subheadline)
            }
        }
        .padding()
    }

}

#if DEBUG
struct EventLinksView_Previews : PreviewProvider {
    static var previews: some View {
        EventLinksView(event: EventsData().events[0])
    }
}
#endif
