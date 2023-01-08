//
//  ProfileViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/08.
//

import Foundation

import FirebaseAuth
import FirebaseStorage

final class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        Task {
            try await followingColleciton.document(currentUid).collection("user-following").document(user.id).setData([:])
            try await followerCollection.document(user.id).collection("user-followers").document(currentUid).setData([:])
            
            await MainActor.run {
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        
    }
}
