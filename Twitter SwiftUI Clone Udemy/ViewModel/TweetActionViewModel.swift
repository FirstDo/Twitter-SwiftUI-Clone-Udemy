//
//  TweetActionViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/24.
//

import Foundation

import FirebaseAuth
import Firebase

final class TweetActionViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    
    func likeTweet() async {
        guard let uid = AuthViewModel.shared.userSession?.uid else {
            return
        }
        let tweetLikesRef = tweetCollection.document(tweet.id).collection("tweet-likes")
        let userLikesRef = userCollection.document(uid).collection("user-likes")
        
        try! await tweetCollection.document(tweet.id).updateData(["likes:" : tweet.likes + 1])
        try! await tweetLikesRef.document(uid).setData([:])
        try! await userLikesRef.document(tweet.id).setData([:])
        self.didLike = true
    }
    
    func unlikeTweet() {
        
    }
}
