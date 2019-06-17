import Foundation
import CryptoKit

@available(OSX 10.15, iOS 13.0, *)
public class MarvelAPI {
	public static let instance = MarvelAPI()
	
	var publicKey = "LOADED_BY_CONSUMER"
	var privateKey = "LOADED_BY_CONSUMER"
	var session = URLSession.shared
	var timestamp = Int(Date().timeIntervalSinceReferenceDate)
	let decoder = JSONDecoder()

	enum MarvelError: Error, LocalizedError { case missingKeys, noDataReturned, unableToBuildRequest, serverError(String)
		var localizedDescription: String {
			switch self {
			case .missingKeys: return "No Private or Public key set"
			case .noDataReturned: return "The server returned no data"
			case .unableToBuildRequest: return "Unable to build a request"
			case .serverError(let content): return content
			}
		}
		
	}
	
	public func loadKeys(public publicKey: String, private privateKey: String) {
		self.publicKey = publicKey
		self.privateKey = privateKey
	}
	
	let url = URL(string: "https://gateway.marvel.com:443/v1/public/")!
	
	func buildRequest(for endpoint: String, params: [String: String] = [:]) throws -> URLRequest {
		guard self.publicKey != "LOADED_BY_CONSUMER", self.privateKey != "LOADED_BY_CONSUMER", !self.publicKey.isEmpty, !self.privateKey.isEmpty else {
			throw MarvelError.missingKeys
		}

		var components = URLComponents(url: self.url.appendingPathComponent(endpoint), resolvingAgainstBaseURL: true)
		
		self.timestamp += 1
		let hash = "\(self.timestamp)\(self.privateKey)\(self.publicKey)"
		
		components?.queryItems = [URLQueryItem(name: "apikey", value: self.publicKey), URLQueryItem(name: "hash", value: "\(hash.MD5)"), URLQueryItem(name: "ts", value: "\(self.timestamp)")] + params.map { URLQueryItem(name: $0, value: $1) }
		
		guard let url = components?.url else { throw MarvelError.unableToBuildRequest }
		let request = URLRequest(url: url)
		
		return request
	}
	
	public func fetch<ResultKind: Codable>(endpoint: String, completion: @escaping (Result<ResultKind, Error>) -> Void) {
		do {
			let request = try self.buildRequest(for: endpoint)
			self.fetch(request: request, completion: completion)
		} catch {
			completion(.failure(error))
		}
		
	}
	
	public func fetch<ResultKind: Codable>(request: URLRequest, completion: @escaping (Result<ResultKind, Error>) -> Void) {
		let task = self.session.dataTask(with: request) { potential, response, error in
			if let err = error {
				completion(.failure(err))
				return
			}
			
			guard let data = potential else {
				completion(.failure(MarvelError.noDataReturned))
				return
			}
			
			do {
				let payload = try self.decoder.decode(ResultKind.self, from: data)
				completion(.success(payload))
			} catch {
				if let serverError = try? self.decoder.decode(ServerError.self, from: data) {
					completion(.failure(MarvelError.serverError(serverError.message)))
				} else {
					completion(.failure(error))
				}
			}
		}
		
		task.resume()
	}
	
	public func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
		self.fetch(endpoint: "characters") { (result: Result<PayloadWrapper<Character>, Error>) in
			switch result {
			case .failure(let err): completion(.failure(err))
			case .success(let results): completion(.success(results.data.results))
			}
		}
	}
}

@available(OSX 10.15, iOS 13.0, *)
extension String {
	var MD5: String {
		let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
		
		return digest.map {
			return $0 == 0 ? "" : String(format: "%02hhx", $0)
		}.joined()
	}

}
