//
//  ContentView.swift
//  Messenger
//
//  Created by Леонид Попов on 03.04.2021.
//

import SwiftUI

struct ContentView: View { 
     @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        if (viewModel.isLoggedIn) {
            ChatsView().environmentObject(viewModel)
        } else {
            LogInView().environmentObject(viewModel)
        }
    }
}

