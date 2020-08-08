import XCTest
@testable import VCore

final class VCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(VCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
