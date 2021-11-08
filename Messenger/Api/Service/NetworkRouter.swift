//
//  NetworkRouter.swift
//  Messenger
//
//  Created by Леонид Попов on 30.05.2021.
//

import Foundation

public typealias NetworkRouterComplition = (_ data: Data?, _ response: URLResponse?, _ error: Error? ) -> ();

protocol NetworkRouter {
    associatedtype EndPoint: EndPointType;
    func request(_ route: EndPoint, complition: @escaping NetworkRouterComplition)
    func cancel()
}
