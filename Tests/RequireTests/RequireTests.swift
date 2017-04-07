import Foundation
import XCTest
import Require

class RequireTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(Require().text, "Hello, World!")
    }
}

#if os(Linux)
extension RequireTests {
    static var allTests : [(String, (RequireTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
#endif
