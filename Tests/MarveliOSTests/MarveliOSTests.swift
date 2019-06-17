import XCTest
@testable import MarveliOS

@available(OSX 10.15, iOS 13.0, *)
final class MarveliOSTests: XCTestCase {
	override func setUp() {
		MarvelAPI.instance.loadKeys(public: "", private: "")
		MarvelAPI.instance.loadKeys(public: "f4c074c5e1e9b267ec7c1628481f5689", private: "809b165877c8e213c316cf0c476fb0bad1205505")
	}
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }
	
	func testGetCharacters() {
		let expectation = self.expectation(description: "Fetch Characters")
		
		let limit = 50
		ServerObjectFetcher<Character>(limit: limit) { fetcher in
			if let err = fetcher.error {
				print("Error fetching characters: \(err)")
			} else if fetcher.all.count >= limit {
				print(fetcher.all.map { $0.name })
				expectation.fulfill()
			}
		}.run()
		
		self.wait(for: [expectation], timeout: 60)
	}

    static var allTests = [
        ("testExample", testExample),
    ]
}
