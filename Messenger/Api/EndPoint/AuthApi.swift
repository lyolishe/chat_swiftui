//
//  AuthApi.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public enum AuthApi {
    case login(login: String, password: String);
    case me;
    case logout;
}

extension AuthApi: EndPointType {
    var path: String {
        switch self {
        case .login: return "login";
        case .me:  return "me";
        case .logout: return "logout";

        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .me:
            return .get
            
        default:
            return .post;
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let login, let password):
            return .requestParametrs(bodyParams: ["login": login, "password": password], queryParams: nil)
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
        
    }
    
    var baseUrl: URL {
        guard let url = URL(string: "http://localhost:5000/api/auth") else {
            fatalError("Could not convert url")
        }
        
        return url
    }
}
