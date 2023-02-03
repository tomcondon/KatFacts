//
//  KatFactsTests.swift
//  KatFactsTests
//
//  Created by Thomas Condon on 1/31/23.
//

import XCTest
@testable import KatFacts

final class KatFactsTests: XCTestCase {

    /// The most important test, perhaps. This SFSymbol must always load so it can be force unwrapped
    /// in the application
    func testSFSymbolsAvailable() throws {
        XCTAssertNotNil(UIImage(systemName: "questionmark.app.dashed"))
    }
}
