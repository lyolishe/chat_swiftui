//
//  RegisterView.swift
//  Messenger
//
//  Created by Леонид Попов on 04.04.2021.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("Register")
//                Color.black
//                    .ignoresSafeArea();
//
//                VStack(alignment: .center) {
//                    Text("Register")
//                        .foregroundColor(Color.white)
//                        .font(.largeTitle)
//                        .bold()
//                        .kerning(2.5)
//
//                    Spacer()
//                    VStack(alignment: .leading, spacing: 0) {
//                        Text("Login")
//                            .foregroundColor(.white)
//                            .padding(.leading)
//
//                        TextField("", text: $viewModel.login)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .keyboardType(.emailAddress)
//                            .padding()
//                    }
//                }
            }
        }

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .previewDevice("iPhone 11")
    }
}
