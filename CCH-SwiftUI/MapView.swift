import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    let coordinate: CLLocationCoordinate2D
    let pinTitle: String

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5, longitudinalMeters: 5)
        view.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = pinTitle
        view.addAnnotation(annotation)
    }

}

#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868), pinTitle: "Here")
    }
}
#endif
