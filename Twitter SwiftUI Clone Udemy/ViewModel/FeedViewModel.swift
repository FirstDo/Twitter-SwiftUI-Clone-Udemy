//
//  FeedViewModel.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/23.
//

import Foundation

final class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        Task {
            await fetchTweets()
        }
    }
    
    func fetchTweets() async {
        let snapshot = try! await tweetCollection.getDocuments()
        let documents = snapshot.documents
        await MainActor.run {
            self.tweets = documents.map { Tweet(dictionary: $0.data() )}
            print(self.tweets.description)
        }
    }
}
