//
//  LoginView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 14/06/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack { Spacer() }
                    
                    Text("Hello.")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Welcome Back")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 40) {
                        
                        CustomTextField(imageName: "envelope",
                                        placeholderText: "Email",
                                        isSecureField: false,
                                        text: $email)
                        
                        CustomTextField(imageName: "lock",
                                        placeholderText: "Password",
                                        isSecureField: true,
                                        text: $password)
                        
                    }
                    .padding([.top, .horizontal], 32)
                    
                }
                .padding(.leading)
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("Reset password...")) {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        }
                }
                
                Button(action: {
                    viewModel.login(withEmail: email, password: password)
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                NavigationLink(
                    destination:
                        RegistrationView()
                        .navigationBarBackButtonHidden(true)) {
                            HStack {
                                
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                        }
            }
            //            .ignoresSafeArea()
            //            .background(Color.red)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
