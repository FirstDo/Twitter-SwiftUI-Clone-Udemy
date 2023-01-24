//
//  Tweet.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/23.
//

import Foundation
import Firebase

struct Tweet: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    let lieks: Int
    let uid: String
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.lieks = dictionary["likes"] as? Int ?? 0
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: .now)
    }
}
