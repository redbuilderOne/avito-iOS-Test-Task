//
//  avito_iOS_Test_TaskTests.swift
//  avito-iOS-Test-TaskTests
//
//  Created by Дмитрий Скворцов on 06.09.2022.
//

import XCTest
@testable import avito_iOS_Test_Task

class avito_iOS_Test_TaskTests: XCTestCase {
    var viewController: ViewController?

    override func setUpWithError() throws {
        viewController = ViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil
    }

    func testURLNoNil() {
        let url = URLStrings.avitoURL.rawValue
        XCTAssertNotNil(url, "not nil")
    }

    func testParseWithEmptyURL() throws {
        // given
        let expectedResult = true
        var parseResult: Bool

        // when
        parseResult = ((viewController?.parseJSON(URLStrings.avitoURL.rawValue)) != nil)

        // then
        XCTAssertEqual(expectedResult, parseResult)
    }

    func testPerformanceExample() throws {

        measure {

        }
    }

}
