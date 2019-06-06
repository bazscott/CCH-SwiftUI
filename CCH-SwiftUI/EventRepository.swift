import Foundation

class EventRepository {

    enum RepositoryError: Error {
        case apiError(errorDescription: String)
        case invalidURL
        case invalidResponse
        case noData
        case decodeError
    }

    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return jsonDecoder
    }()

    func fetchEvents(completion: @escaping (Result<[CCHEvent], RepositoryError>) -> Void) {
        guard let url = URL(string: "https://www.melbournecocoaheads.com/api/events") else { completion(.failure(.invalidURL)); return }

        URLSession.shared.dataTask(with: url) { (result) in
            switch result {
            case .success(let response, let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let eventsPage = try self.jsonDecoder.decode(CCHEventsPage.self, from: data)
                    completion(.success(eventsPage.data))
                }
                catch let error {
                    print("Decode error: \(error)")
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(.apiError(errorDescription: error.localizedDescription)))
            }
        }.resume()
    }

}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
