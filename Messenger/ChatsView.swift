//
//  ChatsView.swift
//  Messenger
//
//  Created by Леонид Попов on 23.04.2021.
//

import SwiftUI

struct ChatsView: View {
    @EnvironmentObject var viewModel: LoginViewModel;
    
    var body: some View {
        NavigationView {
            Text("You are \(viewModel.user!.login) \(viewModel.user!.password)")
        }
    }
}
