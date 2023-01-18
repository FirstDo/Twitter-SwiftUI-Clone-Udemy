//
//  UploadTweetViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/08.
//

import SwiftUI

import Firebase

final class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uplaodTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = tweetCollection.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "timestamp": Timestamp(date: .now),
            "username": user.username,
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded tweet..")
            self.isPresented = false
        }
    }
}
