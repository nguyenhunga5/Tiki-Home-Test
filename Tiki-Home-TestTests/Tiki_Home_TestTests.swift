//
//  Tiki_Home_TestTests.swift
//  Tiki-Home-TestTests
//
//  Created by Hung Nguyen Thanh on 3/22/19.
//  Copyright © 2019 Hung Nguyen Thanh. All rights reserved.
//

import XCTest
@testable import Tiki_Home_Test

class Tiki_Home_TestTests: XCTestCase {

    var keywords: THTKeywords?
    var finishSetup: Bool = false
    
    override func setUp() {
        THTNetwork.sharred.getMostKeywords {[weak self] keywords in
            if let keywords = keywords {
                self?.keywords = keywords
            } else {
                XCTFail("Cannot get keywords list")
            }
            self?.finishSetup = true
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
