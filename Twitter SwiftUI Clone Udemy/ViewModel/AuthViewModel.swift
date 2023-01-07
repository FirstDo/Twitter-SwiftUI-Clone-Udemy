//
//  AuthViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/07.
//

import SwiftUI
import Firebase

final class AuthViewModel: ObservableObject {
    func login() {
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: Image) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                debugPrint("error: \(error?.localizedDescription)")
                return
            }
            
            debugPrint("Success")
        }
    }
}
