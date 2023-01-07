//
//  AuthViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/07.
//

import SwiftUI
import Firebase
import FirebaseStorage

final class AuthViewModel: ObservableObject {
    func login() {
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = UUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        Task {
            let _ = try! await storageRef.putDataAsync(imageData)
            
            debugPrint("upload photo!")
            
            let url = try! await storageRef.downloadURL()
            let profileImageUrl = url.absoluteString
            
            let user = try! await Auth.auth().createUser(withEmail: email, password: password).user
            let data = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "profileImageUrl": profileImageUrl,
                "uid": user.uid
            ]
            
            try! await Firestore.firestore().collection("users").document(user.uid).setData(data)
            debugPrint("upload user data!")
        }
    }
}
