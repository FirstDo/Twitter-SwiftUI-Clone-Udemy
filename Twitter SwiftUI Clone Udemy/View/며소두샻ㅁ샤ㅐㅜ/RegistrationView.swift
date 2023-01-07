//
//  RegistrationView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/05.
//

import SwiftUI
import PhotosUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var username = ""
    @State var showImagePicker = false
    @State var image: Image?
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showImagePicker.toggle()
                } label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()

                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .padding(.top, 88)
                    .padding(.bottom, 16)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: $image)
                }
                
                VStack(spacing: 20) {
                    CustomTextField(text: $email, placeHolder: "Email", imageName: "envelope")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                    
                    CustomTextField(text: $fullname, placeHolder: "Full Name", imageName: "person")
                        .padding()
                        .background(Color(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                    
                    CustomTextField(text: $username, placeHolder: "Username", imageName: "person")
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
                    
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
