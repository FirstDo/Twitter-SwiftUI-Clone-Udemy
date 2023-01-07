//
//  Twitter_SwiftUI_Clone_UdemyApp.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/01.
//

import SwiftUI
import Firebase

@main
struct Twitter_SwiftUI_Clone_UdemyApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}
