//
//  Constants.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/08.
//

import FirebaseFirestore

let userCollection = Firestore.firestore().collection("users")
let followerCollection = Firestore.firestore().collection("followers")
let followingColleciton = Firestore.firestore().collection("following")
