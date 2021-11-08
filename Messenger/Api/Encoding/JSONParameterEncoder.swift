//
//  JSONParameterEncoder.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public struct JSONParameterEncoder: ParametrEncorer {
    public static func encode(urlRequest: inout URLRequest, with parametrs: Parameters) throws {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parametrs, options: .prettyPrinted)
            
            urlRequest.httpBody = jsonData;
            
            if (urlRequest.value(forHTTPHeaderField: "Content-Type") == nil) {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type");
            }
        } catch {
            throw NetworkError.encodingFailed;
        }
    }
}
