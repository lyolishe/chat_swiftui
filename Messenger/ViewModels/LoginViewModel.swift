//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Леонид Попов on 08.04.2021.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @AppStorage("token") private var storageToken: String?
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var user: User?
    private var authApi: AuthController = AuthController()
    
    init () {
        self.fetchUser()
    }
    
    func fetchUser() {
        authApi.getUser { response, error in
            if (error != nil) {
                DispatchQueue.main.async {
                    self.isLoggedIn = false;
                }
                return;
            }
            
            if let response = response {
                self.user = response;
            }
            
        }
    }
    
    func logInAsync() {
        authApi.login(login: login, password: password) { token, error in
            if let token = token {
                self.storageToken = token
                print(self.storageToken)
            } else if let error = error {
                print(error)
            }
        }
    }
}
