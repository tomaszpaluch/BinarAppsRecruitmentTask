//
//  MathJSResultView.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

class MathJSResultView: UIView {
    private let infoLabel: UILabel
    private let resultLabel: UILabel
    
    init(result: String) {
        infoLabel = UILabel()
        resultLabel = UILabel()
        
        super.init(frame: .zero)
        
        infoLabel.text = "MathJS response is"
        resultLabel.text = result
        
        addSubview(infoLabel)
        addSubview(resultLabel)
        
        setupInfoLabelConstraints()
        setupResultLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInfoLabelConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(
            equalTo: topAnchor
        ).isActive = true
        infoLabel.centerXAnchor.constraint(
            equalTo: centerXAnchor
        ).isActive = true
    }
    
    private func setupResultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(
            equalTo: infoLabel.bottomAnchor,
            constant: 16
        ).isActive = true
        resultLabel.centerXAnchor.constraint(
            equalTo: infoLabel.centerXAnchor
        ).isActive = true
        resultLabel.bottomAnchor.constraint(
            equalTo: bottomAnchor
        ).isActive = true
    }
}
