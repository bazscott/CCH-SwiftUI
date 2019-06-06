import Foundation

extension Date {

    func listStyle() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YYYY, HH:mm"
        return dateFormatter.string(from: self)
    }
    
}
