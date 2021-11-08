//
//  RegisterViewModel.swift
//  Messenger
//
//  Created by Леонид Попов on 24.04.2021.
//

import Foundation
import SwiftUI

class RegisterViewModel: ObservableObject{
    var loginViewModel: LoginViewModel;
    @Environment(\.managedObjectContext) var context;
    
    @Published var login: String = "";
    @Published var password: String = "";
    @Published var phone: String = "";
    
    init(loginViewModel model: LoginViewModel) {
        self.loginViewModel = model
    }
    
    func registerUser() {
        
        
    }
}
