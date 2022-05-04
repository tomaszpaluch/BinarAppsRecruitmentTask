//
//  Logic.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 01/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

class CalculatorLogic: NSObject {
    var setOperationSymbol: ((String) -> Void)? {
        didSet {
            setOperationSymbol?(operationData.operation.symbol)
        }
    }
    
    var setFirstOperandLabel: ((Double) -> Void)? {
        didSet {
            setFirstOperandLabel?(operationData.firstOperand)
        }
    }
    
    var setSecondOperandLabel: ((Double) -> Void)? {
        didSet {
            setSecondOperandLabel?(operationData.secondOperand)
        }
    }
    
    var setResultLabel: ((String) -> Void)? {
        didSet {
            setResultLabel?(operationData.description)
        }
    }
    
    var setResultButtonEnabled: ((Bool) -> Void)?
    
    private let operations: [MathOperation]
    
    let minSecondOperand: Int
    let maxSecondOperand: Int
    
    var operationData: OperationData
    
    override init() {
        let addition = Addition()
        
        operations = [
            addition,
            Subtraction(),
            Multiplication(),
            Division()
        ]
        
        operationData = OperationData(
            operation: addition,
            firstOperand: 0,
            secondOperand: 0
        )
        
        minSecondOperand = -100
        maxSecondOperand = 100
        
        super.init()
    }
    
    func setupSegmentedControl(_ control: UISegmentedControl) {
        operations.map { $0.symbol }.enumerated().forEach { offset, value in
            control.insertSegment(
                withTitle: value,
                at: offset,
                animated: true
            )
        }
        
        if let currentOperationIndex = operations.firstIndex(where: { $0 === operationData.operation }) {
            control.selectedSegmentIndex = currentOperationIndex
        }
        
        control.addTarget(
            self,
            action: #selector(segmentSelected(_:)),
            for: .valueChanged
        )
    }
    
    @objc private func segmentSelected(_ control: UISegmentedControl) {
        selectSegment(at: control.selectedSegmentIndex)
    }
    
    private func selectSegment(at index: Int) {
        let operation = operations[index]
        operationData.operation = operation
        setOperationSymbol?(operation.symbol)
        
        precalculate()
    }
    
    func setupStepper(_ control: UIStepper) {
        control.value = Double(operationData.firstOperand)
        control.addTarget(
            self,
            action: #selector(stepperChanged),
            for: .valueChanged
        )
    }
    
    @objc private func stepperChanged(_ control: UIStepper) {
        setFirstOperand(
            value: Int(control.value)
        )
    }
    
    private func setFirstOperand(value: Int) {
        operationData.firstOperand = Double(value)
        setFirstOperandLabel?(operationData.firstOperand)
        
        precalculate()
    }
    
    func setupSlider(_ control: UISlider) {
        control.value = calculateInitialSliderValue()
        control.addTarget(
            self,
            action: #selector(sliderChanged),
            for: .valueChanged
        )
    }
    
    private func calculateInitialSliderValue() -> Float {
        Float((operationData.secondOperand - Double(minSecondOperand)) / Double(maxSecondOperand - minSecondOperand))
    }
    
    @objc private func sliderChanged(_ control: UISlider) {
        setSecondOperand(
            value: control.value
        )
    }
    
    private func setSecondOperand(value: Float) {
        operationData.secondOperand = Double(value) * Double(maxSecondOperand - minSecondOperand) + Double(minSecondOperand)
        setSecondOperandLabel?(operationData.secondOperand)

        precalculate()
    }
    
    private func precalculate() {
        if operationData.operation.isCalculationPossible(
            for: Double(operationData.firstOperand),
            rValue: operationData.secondOperand
        ) {
            setResultButtonEnabled?(true)
        } else {
            setResultButtonEnabled?(false)
        }
        
        setResultLabel?(operationData.description)
    }
    
    func makeResultViewController() -> UIViewController {
        ResultViewController(
            logic: .init(
                operation: operationData
            )
        )
    }
}
