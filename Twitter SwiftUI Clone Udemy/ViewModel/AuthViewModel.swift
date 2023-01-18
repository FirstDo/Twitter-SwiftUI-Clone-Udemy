//
//  AuthViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/07.
//

import SwiftUI

import FirebaseAuth
import FirebaseStorage

final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? {
        didSet {
            Task { await fetchUser() }
        }
    }
    
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    private init() {
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
            await MainActor.run {
                self.error = error
                debugPrint("login error: ", error.localizedDescription)
            }
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
            
            try await userCollection.document(user.uid).setData(data)
            await MainActor.run {
                self.userSession = user
            }
        } catch {
            await MainActor.run {
                self.error = error
                debugPrint("register error: ", error.localizedDescription)
            }
        }
    }
    
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() async {
        guard let uid = userSession?.uid else {
            return debugPrint("Error: User does not exist")
        }
        
        do {
            let snapshot = try await userCollection.document(uid).getDocument()
            guard let userData = snapshot.data() else { return }
            
            await MainActor.run {
                self.user = User(dictionary: userData)
                debugPrint("User is \(user?.username)")
            }
        } catch {
            await MainActor.run {
                self.error = error
                debugPrint("fetchUser error: ", error.localizedDescription)
            }
        }
    }
}
