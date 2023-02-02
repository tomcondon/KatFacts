//
//  KatFactsTests.swift
//  KatFactsTests
//
//  Created by Thomas Condon on 1/31/23.
//

import XCTest
@testable import KatFacts

final class KatFactsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    /// The most important test, perhaps. This SFSymbol must always load so it can be force unwrapped
    /// in the application
    func testSFSymbolsAvailable() throws {
        XCTAssertNotNil(UIImage(systemName: "questionmark.app.dashed"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
