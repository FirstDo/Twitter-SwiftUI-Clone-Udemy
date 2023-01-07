//
//  LoginView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/05.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeHolder: "Email", imageName: "envelope")
                            .padding()
                            .background(Color(white: 1, opacity: 0.15))
                            .cornerRadius(10)
                        
                        CustomSecureField(text: $password, placeHolder: "Password")
                            .padding()
                            .background(Color(white: 1, opacity: 0.15))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 32)
                    .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Forget Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .padding(.trailing, 32)
                        }
                    }
                    
                    Button {
                        Task {
                            await viewModel.login(withEmail: email, password: password)
                        }
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden()) {
                        HStack {
                            Text("Don't jave an account?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                }
            }
            .background(Color("baseColor"))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
