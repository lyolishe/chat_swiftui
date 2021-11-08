//
//  LogInView.swift
//  Messenger
//
//  Created by Леонид Попов on 04.04.2021.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text("Log In")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold()
                        .kerning(2.5)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        TextField("", text: $viewModel.login)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .padding()
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Password")
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        SecureField("", text: $viewModel.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: RegisterView()) {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Button(action: viewModel.logInAsync) {
                            Text("→")
                                .padding(7)
                                .foregroundColor(.blue)
                                .font(.title2)
                        }
                        .overlay(
                            Circle()
                                .stroke(Color.blue, lineWidth:1)
                        )
                        
                    }.padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
