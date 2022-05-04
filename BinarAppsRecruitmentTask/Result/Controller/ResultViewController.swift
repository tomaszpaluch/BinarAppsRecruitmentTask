//
//  ResultViewController.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    private let logic: ResultLogic
    
    private let resultLabel: UILabel
    private var mathJSView: UIView?
    
    init(logic: ResultLogic) {
        self.logic = logic
        resultLabel = UILabel()
        let mathJSWaitingView = MathJSWaitingView()
        self.mathJSView = mathJSWaitingView
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Result"
        view.backgroundColor = .lightGray
               
        resultLabel.font = .systemFont(ofSize: 80)
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.textAlignment = .center
        
        resultLabel.text = logic.resultLabelText
        
        view.addSubview(resultLabel)
        view.addSubview(mathJSWaitingView)
        
        setupResultLabelConstraints()
        setupMathJSViewConstraints(mathJSWaitingView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupResultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultLabel.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        ).isActive = true
        resultLabel.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        resultLabel.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 0.8
        ).isActive = true
    }
    
    private func setupMathJSViewConstraints(_ mathJSView: UIView) {
        mathJSView.translatesAutoresizingMaskIntoConstraints = false
        
        mathJSView.topAnchor.constraint(
            equalTo: resultLabel.bottomAnchor,
            constant: 20
        ).isActive = true
        mathJSView.widthAnchor.constraint(
            equalTo: view.widthAnchor
        ).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        logic.whenViewDidAppear { [weak self] result in
            let resultView = MathJSResultView(result: result)
            
            DispatchQueue.main.async {
                self?.mathJSView?.removeFromSuperview()
                self?.view.addSubview(resultView)
                self?.setupMathJSViewConstraints(resultView)
                self?.mathJSView = resultView
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        logic.whenViewWillDisappear()
    }
}
