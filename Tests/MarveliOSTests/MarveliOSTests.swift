import XCTest
@testable import MarveliOS

@available(OSX 10.15, *)
final class MarveliOSTests: XCTestCase {
	override func setUp() {
		MarvelAPI.instance.loadKeys(public: "", private: "")
	}
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }
	
	func testGetCharacters() {
		let expectation = self.expectation(description: "Fetch Characters")
		MarvelAPI.instance.fetchCharacters() { result in
			switch result {
			case .success(let characters):
				print(characters)
			case .failure(let error):
				print("Error fetching characters: \(error)")
				XCTFail()
			}
			expectation.fulfill()
		}
		
		self.wait(for: [expectation], timeout: 30)
	}

    static var allTests = [
        ("testExample", testExample),
    ]
}
