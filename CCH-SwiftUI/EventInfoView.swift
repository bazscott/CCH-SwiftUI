import SwiftUI

struct EventInfoView: View {

    let event: CCHEvent

    var body: some View {
        return VStack(alignment: .leading) {
            Text(event.title)
                .minimumScaleFactor(0.75)
                .lineLimit(0)
                .font(.title)
            HStack {
                Image(systemName: "calendar")
                Text(event.startDate?.listStyle() ?? "No date")
                    .font(.subheadline)
            }
            HStack {
                Image(systemName: "map")
                Text(event.address?.display ?? "")
            }
        }
        .padding()
    }
}

#if DEBUG
struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView(event: EventsData().events[0])
    }
}
#endif
