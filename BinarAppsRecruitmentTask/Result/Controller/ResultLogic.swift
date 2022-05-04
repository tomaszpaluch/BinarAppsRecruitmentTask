//
//  ResultLogic.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 01/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import Foundation

class ResultLogic {
    private var operation: OperationData
    private let mathJSAPI: MathJSAPI?
    
    var resultLabelText: String {
        String(operation.result)
    }
    
    init(operation: OperationData) {
        self.operation = operation
        mathJSAPI = MathJSAPI()
    }
    
    func whenViewDidAppear(completion: @escaping (String) -> Void) {
        mathJSAPI?.sendRequest(
            for: operation,
            completion: completion
        )
    }
    
    func whenViewWillDisappear() {
        mathJSAPI?.cancelTask()
    }
}
