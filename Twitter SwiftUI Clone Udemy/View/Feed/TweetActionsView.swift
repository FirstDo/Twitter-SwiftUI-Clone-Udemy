//
//  TweetActionsView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/24.
//

import SwiftUI

struct TweetActionsView: View {
    @StateObject var viewModel: TweetActionViewModel
    
    init(tweet: Tweet) {
        self._viewModel = StateObject(wrappedValue: .init(tweet: tweet))
    }
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
                }
            } label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
        }
        .foregroundColor(.gray)
    }
}
