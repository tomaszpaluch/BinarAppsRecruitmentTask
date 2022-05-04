//
//  MathOperation.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import Foundation

protocol MathOperation: class {
    var symbol: String { get }
    
    func isCalculationPossible(for lValue: Double, rValue: Double) -> Bool
    func calculate(lValue: Double, rValue: Double) -> Double
}

class Addition: MathOperation {
    let symbol: String
    
    init() {
        symbol = "+"
    }
    
    func isCalculationPossible(for lValue: Double, rValue: Double) -> Bool {
        true
    }
    
    func calculate(lValue: Double, rValue: Double) -> Double {
        lValue + rValue
    }
}

class Subtraction: MathOperation {
    let symbol: String
    
    init() {
        symbol = "-"
    }
    
    func isCalculationPossible(for lValue: Double, rValue: Double) -> Bool {
        true
    }
    
    func calculate(lValue: Double, rValue: Double) -> Double {
        lValue - rValue
    }
}

class Multiplication: MathOperation {
    let symbol: String
    
    init() {
        symbol = "*"
    }
    
    func isCalculationPossible(for lValue: Double, rValue: Double) -> Bool {
        true
    }
    
    func calculate(lValue: Double, rValue: Double) -> Double {
        lValue * rValue
    }
}

class Division: MathOperation {
    let symbol: String
    
    init() {
        symbol = "/"
    }
    
    func isCalculationPossible(for lValue: Double, rValue: Double) -> Bool {
        rValue != 0
    }
    
    func calculate(lValue: Double, rValue: Double) -> Double {
        lValue / rValue
    }
}
