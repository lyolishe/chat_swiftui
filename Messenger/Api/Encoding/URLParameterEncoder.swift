//
//  File.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public struct URLParameterEncoder: ParametrEncorer {
    public static func encode(urlRequest: inout URLRequest, with parametrs: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingUrl }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
           !parametrs.isEmpty {
            urlComponents.queryItems = [URLQueryItem]();
            
            for (key, value) in parametrs {
                let queryItem = URLQueryItem(name: key,
                                                value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                
                urlComponents.queryItems?.append(queryItem);
            }
            
            urlRequest.url = urlComponents.url;
        }
        
        if (urlRequest.value(forHTTPHeaderField: "Content-Type") == nil) {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
