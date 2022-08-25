//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Mehmet Can Şimşek on 25.08.2022.
//

import XCTest
@testable import SwiftTesting

class SwiftTestingTests: XCTestCase {

    
    let math = MatematicFunctions()
    
    func testAddIntegersFunction() {
        let result = math.addIntegers(x: 5, y: 8)
        
        XCTAssertEqual(result, 13)
    }
    
    func testMultiplyNumbersFunction() {
        let result1 = math.multiplyNumbers(x: 10, y: 2)
        
        XCTAssertEqual(result1, 20)
    }
    
    func testDivideIntegersFunction() {
        let result2 = math.divideIntegers(x: 10, y: 2)
        
        XCTAssertEqual(result2, 5)
    }
    
    
}
