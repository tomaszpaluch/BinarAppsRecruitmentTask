//
//  CalculatorViewController.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 01/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    private let logic: CalculatorLogic
    
    private let segmentedControl: UISegmentedControl
    private let stepper: UIStepper
    private let firstOperandLabel: UILabel
    private let operatorLabel: UILabel
    private let slider: UISlider
    private let minSecondOperandLabel: UILabel
    private let secondOperandLabel: UILabel
    private let maxSecondOperandLabel: UILabel

    private let resultLabel: UILabel
    private let resultButton: UIButton
    
    init() {
        logic = CalculatorLogic()
        
        segmentedControl = UISegmentedControl()
        firstOperandLabel = UILabel()
        stepper = UIStepper()
        operatorLabel = UILabel()
        slider = UISlider()
        minSecondOperandLabel = UILabel()
        secondOperandLabel = UILabel()
        maxSecondOperandLabel = UILabel()
        resultLabel = UILabel()
        resultButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Calculator"
        view.backgroundColor = .lightGray
        
        logic.setupSegmentedControl(segmentedControl)
        logic.setupStepper(stepper)
        logic.setupSlider(slider)
        
        firstOperandLabel.textColor = .black
        firstOperandLabel.font = .systemFont(ofSize: 20)

        minSecondOperandLabel.text = String(logic.minSecondOperand)
        maxSecondOperandLabel.text = String(logic.maxSecondOperand)
        
        resultButton.setTitle("CALCULATE", for: .normal)
        resultButton.backgroundColor = .systemBlue
        resultButton.addTarget(
            self,
            action: #selector(resultButtonTapped),
            for: .touchUpInside
        )
        
        view.addSubview(segmentedControl)
        view.addSubview(firstOperandLabel)
        view.addSubview(stepper)
        view.addSubview(operatorLabel)
        view.addSubview(slider)
        view.addSubview(minSecondOperandLabel)
        view.addSubview(secondOperandLabel)
        view.addSubview(maxSecondOperandLabel)
        view.addSubview(resultLabel)
        view.addSubview(resultButton)
        
        setupSegmentedControlConstraints()
        setupFirstOperandLabelConstraints()
        setupStepperConstraints()
        setupOperatorLabelConstraints()
        setupSliderConstraints()
        setupSliderLabelsConstraints()
        setupResultButtomConstraints()
        setupResultLabelConstraints()
        
        logic.setOperationSymbol = { [weak self] symbol in
            self?.operatorLabel.text = symbol
        }
        
        logic.setFirstOperandLabel = { [weak self] value in
            self?.firstOperandLabel.text = String(value)
        }
        
        logic.setSecondOperandLabel = { [weak self] value in
            self?.secondOperandLabel.text = String(value)
        }
        
        logic.setResultLabel = { [weak self] resultText in
            self?.resultLabel.text = resultText
        }
        
        logic.setResultButtonEnabled = { [weak self] value in
            self?.resultButton.isEnabled = value
            
            if value {
                self?.resultButton.backgroundColor = .systemBlue
            } else {
                self?.resultButton.backgroundColor = .darkGray
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func resultButtonTapped() {
        navigationController?.pushViewController(
            logic.makeResultViewController(),
            animated: true
        )
    }
    
    private func setupSegmentedControlConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        ).isActive = true
        segmentedControl.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        segmentedControl.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 0.75
        ).isActive = true
    }
    
    private func setupFirstOperandLabelConstraints() {
           firstOperandLabel.translatesAutoresizingMaskIntoConstraints = false
           firstOperandLabel.topAnchor.constraint(
               equalTo: segmentedControl.bottomAnchor,
               constant: 20
           ).isActive = true
           firstOperandLabel.centerXAnchor.constraint(
               equalTo: segmentedControl.centerXAnchor
           ).isActive = true
    }
    
    private func setupStepperConstraints() {
           stepper.translatesAutoresizingMaskIntoConstraints = false
           stepper.topAnchor.constraint(
               equalTo: firstOperandLabel.bottomAnchor,
               constant: 8
           ).isActive = true
           stepper.centerXAnchor.constraint(
               equalTo: firstOperandLabel.centerXAnchor
           ).isActive = true
    }
    
    private func setupOperatorLabelConstraints() {
           operatorLabel.translatesAutoresizingMaskIntoConstraints = false
           operatorLabel.topAnchor.constraint(
               equalTo: stepper.bottomAnchor,
               constant: 20
           ).isActive = true
           operatorLabel.centerXAnchor.constraint(
               equalTo: stepper.centerXAnchor
           ).isActive = true
    }
        
    private func setupSliderConstraints() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(
            equalTo: operatorLabel.bottomAnchor,
            constant: 20
        ).isActive = true
        slider.centerXAnchor.constraint(
            equalTo: operatorLabel.centerXAnchor
        ).isActive = true
        slider.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 0.8
        ).isActive = true
    }
    
    private func setupSliderLabelsConstraints() {
        minSecondOperandLabel.translatesAutoresizingMaskIntoConstraints = false
        secondOperandLabel.translatesAutoresizingMaskIntoConstraints = false
        maxSecondOperandLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondOperandLabel.topAnchor.constraint(
            equalTo: slider.bottomAnchor,
            constant: 8
        ).isActive = true
        minSecondOperandLabel.centerYAnchor.constraint(
            equalTo: secondOperandLabel.centerYAnchor
        ).isActive = true
        maxSecondOperandLabel.centerYAnchor.constraint(
            equalTo: secondOperandLabel.centerYAnchor
        ).isActive = true
        
        secondOperandLabel.centerXAnchor.constraint(
            equalTo: slider.centerXAnchor
        ).isActive = true
        minSecondOperandLabel.leftAnchor.constraint(
            equalTo: slider.leftAnchor
        ).isActive = true
        maxSecondOperandLabel.rightAnchor.constraint(
            equalTo: slider.rightAnchor
        ).isActive = true
    }
    
    private func setupResultButtomConstraints() {
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -20
        ).isActive = true
        resultButton.centerXAnchor.constraint(
            equalTo: segmentedControl.centerXAnchor
        ).isActive = true
        resultButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        resultButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
    
    private func setupResultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.bottomAnchor.constraint(
            equalTo: resultButton.topAnchor,
            constant: -8
        ).isActive = true
        resultLabel.centerXAnchor.constraint(
            equalTo: resultButton.centerXAnchor
        ).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        resultButton.layer.masksToBounds = true
        resultButton.layer.cornerRadius = 11
    }
}
