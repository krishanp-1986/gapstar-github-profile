//
//  JsonUtiilityTest.swift
//  Github-ProfileTests
//
//  Created by Krishantha on 06/04/2021.
//

import XCTest
@testable import Github_Profile

class JsonUtiilityTest: XCTestCase {
    private let bundle = Bundle(for: JsonUtiilityTest.self)
    
    func test_successsfully_decoding_json() {
        let decodedJsonDict = JsonUtils.convertJsonIntoDecodable([String: String].self,
                                                                 fileName: "valid",
                                                                 bundle: bundle,
                                                                 inDirectory: "TestResources")
        XCTAssertNotNil(decodedJsonDict)
        XCTAssert(decodedJsonDict?.keys.count == 2)
    }
    
    func test_successsfully_decoding_empty_json() {
        let decodedJsonDict = JsonUtils.convertJsonIntoDecodable([String: String].self,
                                                                 fileName: "empty",
                                                                 bundle: bundle,
                                                                 inDirectory: "TestResources")
        XCTAssertNotNil(decodedJsonDict)
        XCTAssertTrue(decodedJsonDict?.isEmpty ?? false)
    }
    
    func test_decoding_invalid_json() {
        let decodedJsonDict = JsonUtils.convertJsonIntoDecodable([String: String].self,
                                                                 fileName: "invalid",
                                                                 bundle: bundle,
                                                                 inDirectory: "TestResources")
        XCTAssertNil(decodedJsonDict)
    }
}
