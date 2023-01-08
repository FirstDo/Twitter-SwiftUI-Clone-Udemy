//
//  SearchViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/08.
//

import Foundation

import Firebase

final class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            await fetchUsers()
        }
    }
    
    private func fetchUsers() async {
        do {
            let snapshot = try await userCollection.getDocuments()
            await MainActor.run {
                self.users = snapshot.documents.map { User(dictionary: $0.data()) }
            }
        } catch {
            debugPrint("Error: fetchUsers ERROR!")
        }
    }
}
