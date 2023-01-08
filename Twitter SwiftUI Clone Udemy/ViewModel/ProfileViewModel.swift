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
        Task {
            await self.checkIfUserIsFollowed()
        }
    }
    
    func follow() async {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = followingColleciton.document(currentUid).collection("user-following")
        let followersRef = followerCollection.document(user.id).collection("user-followers")
        
        do {
            try await followingRef.document(user.id).setData([:])
            try await followersRef.document(currentUid).setData([:])
            
            await MainActor.run {
                self.isFollowed = true
            }
        } catch {
            debugPrint("Follow Error: \(error.localizedDescription)")
        }
    }
    
    func unfollow() async {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = followingColleciton.document(currentUid).collection("user-following")
        let followersRef = followerCollection.document(user.id).collection("user-followers")
        
        do {
            try await followingRef.document(user.id).delete()
            try await followersRef.document(currentUid).delete()
            
            await MainActor.run {
                self.isFollowed = false
            }
        } catch {
            debugPrint("Unfollow Error: \(error.localizedDescription)")
        }
    }
    
    func checkIfUserIsFollowed() async {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let followingRef = followingColleciton.document(currentUid).collection("user-following")
        
        do {
            let snapshot = try await followingRef.document(user.id).getDocument()
            await MainActor.run {
                self.isFollowed = snapshot.exists
            }
        } catch {
            debugPrint("checkIfUserIsFollowed Error: \(error.localizedDescription)")
        }
    }
}
