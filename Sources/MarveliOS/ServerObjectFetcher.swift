//
//  ServerObjectFetcher.swift
//
//
//  Created by Ben Gottlieb on 6/16/19.
//

import Foundation


@available(OSX 10.15, iOS 13.0, *)
public class ServerObjectFetcher<Type: ServerObject> {
	public var error: Error?
	public var all: [Type] = []
	public var recent: [Type] = []
	public var done = false
	public var progress: Progress?

	let completion: (ServerObjectFetcher) -> Void
	var limit: Int
	
	public init(limit: Int? = nil, completion: @escaping (ServerObjectFetcher) -> Void) {
		self.completion = completion
		self.limit = limit ?? Int.max
	}
	
	public func run() {
		self.fetch()
	}
	
	func fetch(offset: Int? = nil) {
		do {
			let params = offset == nil ? [:] : ["offset": "\(offset!)"]
			let request = try MarvelAPI.instance.buildRequest(for: Type.serverPath, params: params)

			MarvelAPI.instance.fetch(request: request) { (result: Result<PayloadWrapper<Type>, Error>) in
				switch result {
				case .failure(let err):
					self.error = err
					
				case .success(let results):
					self.recent = results.data.results
					self.all += results.data.results
					
					if self.progress == nil { self.progress = Progress(totalUnitCount: Int64(results.data.total)) }
					self.progress?.completedUnitCount += Int64(results.data.count)

					let newOffset = results.data.offset + results.data.count
					if newOffset >= min(results.data.total, self.limit) {
						self.done = true
					} else {
						self.fetch(offset: newOffset)
					}
					self.completion(self)
				}
			}
		} catch {
			self.error = error
			completion(self)
		}
	}
}


