//
//  MathJSAPI.swift
//  BinarAppRecruitmentTask
//
//  Created by Tomasz Paluch on 03/05/2022.
//  Copyright © 2022 Tomasz Paluch. All rights reserved.
//

import Foundation

class MathJSAPI {
    private let path: String
    private var task: URLSessionDataTask?
    
    init?() {
        path = "api.mathjs.org/v4/"
        task = nil
    }
    
    func sendRequest(
        for operation: OperationData,
        completion: @escaping (String) -> Void
    ) {
        if let task = makeRequest(
            for: operation,
            completion: completion
            ) {
            self.task = task
            task.resume()
        }
    }
    
    private func makeRequest(
        for operation: OperationData,
        completion: @escaping (String) -> Void
    ) -> URLSessionDataTask? {
        var components = URLComponents()
        components.scheme = "https"
        components.path = path
        
        let queryItemExpr = URLQueryItem(name: "expr", value: operation.request)
        components.queryItems = [queryItemExpr]
        
        components.percentEncodedQuery =  components.percentEncodedQuery?
            .replacingOccurrences(of: "+", with: "%2B")
            .replacingOccurrences(of: "/", with: "%2F")
        
        if let url = components.url {
            return URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data, let result = String(data: data, encoding: .utf8) {
                    completion(result)
                }
            }
        } else {
            return nil
        }
    }
    
    func cancelTask() {
        task?.cancel()
    }
}
