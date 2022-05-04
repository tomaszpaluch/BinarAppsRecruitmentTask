//
//  OperationData.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import Foundation

struct OperationData {
    var operation: MathOperation
    var firstOperand: Double
    var secondOperand: Double
    
    var request: String {
        String(firstOperand) + operation.symbol + String(secondOperand)
    }
    
    var description: String {
        String(firstOperand) + " " + operation.symbol + " " + String(secondOperand)
    }

    var result: Double {
        operation.calculate(
            lValue: firstOperand,
            rValue: secondOperand
        )
    }
}

