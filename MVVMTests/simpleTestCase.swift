//
//  simpleTestCase.swift
//  MVVMTests
//
//  Created by jignesh solanki on 06/02/24.
//

import XCTest

final class simpleTestCase: XCTestCase {
    func testAddition() {
           // Arrange
           let a = 5
           let b = 7
           
           // Act
           let result = add(a: a, b: b)
           
           // Assert
           XCTAssertEqual(result, 12)
       }
       
       func add(a: Int, b: Int) -> Int {
           return a + b
       }

}
