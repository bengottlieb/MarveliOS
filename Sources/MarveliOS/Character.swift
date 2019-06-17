//
//  File.swift
//  
//
//  Created by Ben Gottlieb on 6/16/19.
//

import Foundation

public struct Character: Codable {
	let id: Int
	let name: String
	let description: String
	let modified: String
	let resourceURI: URL?
	let urls: [URLInfo]
	let thumbnail: ImageInfo?
	let comics: ResourceList<ComicSummary>?
}

public struct URLInfo: Codable {
	let url: URL
	let type: String
}

public struct PayloadWrapper<PayloadData: Codable>: Codable {
	let code: Int
	let status: String?
	let attributionText: String?
	let data: PagedWrapper
	let etag: String?
	
	public struct PagedWrapper: Codable {
		let offset: Int
		let limit: Int
		let total: Int
		let count: Int
		let results: [PayloadData]
	}
}

public struct ImageInfo: Codable {
	let path: String
	let `extension`: String
}

public struct ResourceList<Element: Codable>: Codable {
	let available: Int?
	let returned: Int?
	let collectionURI: URL?
	let items: [Element]
}

public struct ComicSummary: Codable {
	let resourceURI: URL?
	let name: String!
}

public struct ServerError: Codable {
	let code: String
	let message: String
}
