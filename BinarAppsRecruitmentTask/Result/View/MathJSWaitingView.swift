//
//  MathJSWaitingView.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import UIKit

class MathJSWaitingView: UIView {
    private let activityIndicator: UIActivityIndicatorView
    private let infoLabel: UILabel
    
    init() {
        activityIndicator = UIActivityIndicatorView()
        infoLabel = UILabel()
        
        super.init(frame: .zero)
        
        activityIndicator.startAnimating()
        infoLabel.text = "Waiting for MathJS response..."
        
        addSubview(activityIndicator)
        addSubview(infoLabel)
        
        setupActivityIndicatorConstraints()
        setupInfoLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(
            equalTo: topAnchor
        ).isActive = true
        activityIndicator.centerXAnchor.constraint(
            equalTo: centerXAnchor
        ).isActive = true
    }
    
    private func setupInfoLabelConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(
            equalTo: activityIndicator.bottomAnchor,
            constant: 16
        ).isActive = true
        infoLabel.centerXAnchor.constraint(
            equalTo: activityIndicator.centerXAnchor
        ).isActive = true
        infoLabel.bottomAnchor.constraint(
            equalTo: bottomAnchor
        ).isActive = true
    }
}
