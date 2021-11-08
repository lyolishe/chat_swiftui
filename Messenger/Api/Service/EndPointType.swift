//
//  EndPointType.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get };
    var path: String { get };
    var httpMethod: HTTPMethod { get };
    var task: HTTPTask { get };
    var headers: HTTPHeaders? { get };
}
