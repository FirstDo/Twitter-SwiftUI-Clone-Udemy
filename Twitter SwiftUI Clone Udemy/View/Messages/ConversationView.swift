//
//  ConversationView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/02.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ChatView(), isActive: $showChat) {
                
            }

            
            ScrollView {
                LazyVStack {
                    ForEach(0..<100) { _ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            ConversationCell()
                        }
                    }
                }
                .padding()
            }
            
            Button {
                isShowingNewMessageView.toggle()
            } label: {
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
            .sheet(isPresented: $isShowingNewMessageView) {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
