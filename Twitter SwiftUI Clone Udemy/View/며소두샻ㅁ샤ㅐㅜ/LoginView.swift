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
    
    var body: some View {
        ZStack {
            VStack {
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                
                VStack {
                    CustomTextField(text: $email, placeHolder: "Email")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeHolder: "Password")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .padding()
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
        .background(Color("baseColor"))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
