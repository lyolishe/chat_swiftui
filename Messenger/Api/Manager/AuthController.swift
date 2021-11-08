//
//  NetworkManager.swift
//  Messenger
//
//  Created by Леонид Попов on 31.05.2021.
//

import Foundation

struct AuthController {
    private let router = Router<AuthApi>();
    
    func login(login: String, password: String, complition: @escaping (_ token: String?, _ error: String?) -> ()) {
        print(login, password)
        router.request(.login(login: login, password: password)) {data, response, error in
            if (error != nil) {
                complition(nil, NetworkResponse.raw.rawValue)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response)
                print("ERROR CODE:", response.statusCode)
                switch result {
                    case .success:
                        guard let responseData = data else {
                            complition(nil, NetworkResponse.noData.rawValue);
                            return;
                        }
                        
                        let token = String(data: responseData, encoding: .utf8);
                        
                        UserDefaults.standard.set(token, forKey: "App.Token");
                        complition(token, nil);
                        
                    case .failure(let error):
                    
                    complition(nil, error)
                }
            }
        }
    }
    
    func getUser(_ complition: @escaping (_ user: User?, _ error: String?) -> ()) {
        router.request(.me) { data, response, error in
            if (error != nil) {
                complition(nil, NetworkResponse.raw.rawValue)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = handleNetworkResponse(response);
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        complition(nil, NetworkResponse.noData.rawValue);
                        return;
                    }
                    
                    do {
                        let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
                        complition(apiResponse, nil)
                    } catch {
                        complition(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let error):
                    complition(nil, error)
                }
            }
        }
    }
}

