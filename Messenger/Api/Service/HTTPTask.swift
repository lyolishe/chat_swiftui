//
//  HTTPTask.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public typealias HTTPHeaders = [String:String];

public enum HTTPTask {
    case request
    
    case requestParametrs(bodyParams: Parameters?, queryParams: Parameters?)
    
    case requestParametrsWithHeaders(bodyParams: Parameters?, queryParams: Parameters?, headers: HTTPHeaders?)
}
