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
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    // @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            await MainActor.run {
                self.userSession = result.user
                debugPrint("Login Success!")
            }
        } catch {
            self.error = error
            debugPrint("login error: ", error.localizedDescription)
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) async {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = UUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            
            debugPrint("upload photo!")
            
            let url = try await storageRef.downloadURL()
            let profileImageUrl = url.absoluteString
            
            let user = try await Auth.auth().createUser(withEmail: email, password: password).user
            let data = [
                "email": email,
                "username": username,
                "fullname": fullname,
                "profileImageUrl": profileImageUrl,
                "uid": user.uid
            ]
            
            try await Firestore.firestore().collection("users").document(user.uid).setData(data)
            self.userSession = user
        } catch {
            self.error = error
            debugPrint("register error: ", error.localizedDescription)
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
