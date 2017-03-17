//
//  HeroedinTests.swift
//  HeroedinTests
//
//  Created by teo on 10/03/2017.
//  Copyright © 2017 teo. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Mockingjay
@testable import Heroedin

class HeroedinTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testGetHash() {
        let hash = MarvelHelper.sharedInstance.getHash(ts: 3)
        XCTAssert(hash == "1f50557ad02e5a2927f11c280df56f1d")
    }
    
    func testGetApiUrl(){
        let url = MarvelHelper.sharedInstance.getUrlForApi(api: "/v1/public/characters")
        XCTAssert(url != "")
    }
}
