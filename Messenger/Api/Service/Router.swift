//
//  Router.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    fileprivate func configurateParametrs(bodyParametrs: Parameters?, queryParametrs: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParametrs = bodyParametrs {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParametrs)
            }
            
            if let queryParams = queryParametrs {
                try URLParameterEncoder.encode(urlRequest: &request, with: queryParams)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func additionalHeaders(_ headers: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = headers else { return }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path))
        
        request.httpMethod = route.httpMethod.rawValue;
        
        do {
            switch route.task {
                case .request:
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type");
                    
                case .requestParametrs(let bodyParams, let queryParams):
                    try self.configurateParametrs(bodyParametrs: bodyParams, queryParametrs: queryParams, request: &request);
                
                case .requestParametrsWithHeaders(let bodyParams, let queryParams, let headers):
                    self.additionalHeaders(headers, request: &request);
                    try self.configurateParametrs(bodyParametrs: bodyParams, queryParametrs: queryParams, request: &request);

            }
            
            return request
        } catch {
            throw error
        }
    }

    func request(_ route: EndPoint, complition: @escaping NetworkRouterComplition) {
        let session = URLSession.shared
        
        
        do {
            let request = try self.buildRequest(from: route);
            
            task = session.dataTask(with: request) { data, response, error in
                complition(data, response, error)
            }
            
        } catch {
            complition(nil, nil, error)
        }
        
        self.task?.resume();
    }
    
    func cancel() {
        self.task?.cancel();
    }
    
}
