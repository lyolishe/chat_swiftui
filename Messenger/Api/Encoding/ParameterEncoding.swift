//
//  ParameterEncoding.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParametrEncorer {
    static func encode(urlRequest: inout URLRequest, with parametrs: Parameters) throws
}

public enum NetworkError: String, Error {
    case paramsNill = "Parametrs were Nil."
    case encodingFailed = "Could not encode parametrs."
    case missingUrl = "Url is nil."
}
