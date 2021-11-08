//
//  NetworlHandler.swift
//  Messenger
//
//  Created by Леонид Попов on 31.05.2021.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authError = "You have to login"
    case badRequest = "Bad Request"
    case outdated = "Requested url is outrated"
    case failed = "Network error"
    case noData = "Response returned no data to decode"
    case unableToDecode = "Can't decode the response"
    case raw = "Check ypir Network connection"
}

enum Result<String> {
    case success
    case failure(String)
}

func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
    switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
    }
}
