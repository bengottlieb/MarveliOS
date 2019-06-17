//
//  Character.swift
//  
//
//  Created by Ben Gottlieb on 6/16/19.
//

import Foundation
import SwiftUI

public protocol ServerObject: Codable {
	static var serverPath: String { get }
}

public struct Character: ServerObject, Identifiable {
	public static var serverPath: String { return "characters" }
	public let id: Int
	public let name: String
	public let description: String
	public let modified: String
	public let resourceURI: URL?
	public let urls: [URLInfo]
	public let thumbnail: ImageInfo?
	public let comics: ResourceList<ComicSummary>?
}

public struct URLInfo: Codable {
	public let url: URL
	public let type: String
}

public struct PayloadWrapper<PayloadData: ServerObject>: Codable {
	public let code: Int
	public let status: String?
	public let attributionText: String?
	public let data: PagedWrapper
	public let etag: String?
	
	public struct PagedWrapper: Codable {
		public let offset: Int
		public let limit: Int
		public let total: Int
		public let count: Int
		public let results: [PayloadData]
	}
}

public struct ImageInfo: Codable {
	public let path: String
	public let `extension`: String
}

public struct ResourceList<Element: Codable>: Codable {
	public let available: Int?
	public let returned: Int?
	public let collectionURI: URL?
	public let items: [Element]
}

public struct ComicSummary: Codable {
	public let resourceURI: URL?
	public let name: String!
}

public struct ServerError: Codable {
	public let code: String
	public let message: String
}
