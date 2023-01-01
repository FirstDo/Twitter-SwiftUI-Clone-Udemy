//
//  ConversationView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/02.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0..<100) { _ in
                        ConversationCell()
                    }
                }
                .padding()
            }
            
            Button(action: {}) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
        .navigationTitle("Home")
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
