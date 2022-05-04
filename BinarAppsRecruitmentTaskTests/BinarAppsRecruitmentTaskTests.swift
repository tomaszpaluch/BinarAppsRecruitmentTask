//
//  BinarAppRecruitmentTaskTests.swift
//  BinarAppRecruitmentTaskTests
//
//  Created by Tomasz Paluch on 01/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import XCTest
@testable import BinarAppsRecruitmentTask

class BinarAppsRecruitmentTaskTests: XCTestCase {
    var operationData: OperationData?
    
    override func setUp() {
        operationData = OperationData(
            operation: Addition(),
            firstOperand: 8,
            secondOperand: 2
        )
    }

    func testAdd8To2() {
        XCTAssertEqual(operationData?.result, 10)
    }
    
    func testSubtract2From8() {
        operationData?.operation = Subtraction()
        
        XCTAssertEqual(operationData?.result, 6)
    }
    
    func testMultiply8With2() {
        operationData?.operation = Multiplication()

        XCTAssertEqual(operationData?.result, 16)
    }
    
    func testDivide8With2() {
        operationData?.operation = Division()

        XCTAssertEqual(operationData?.result, 4)
    }
}
