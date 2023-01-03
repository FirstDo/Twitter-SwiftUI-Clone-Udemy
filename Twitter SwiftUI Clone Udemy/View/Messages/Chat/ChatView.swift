//
//  ChatView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/03.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MockMessage.mocks) { message in
                        HStack {
                            if message.isCurrentUser {
                                Spacer()
                                Text(message.messageText)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(ChatBubble(isFromCurrentUser: message.isCurrentUser))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                            } else {
                                HStack(alignment: .bottom) {
                                    Image(message.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    
                                    Text(message.messageText)
                                        .padding()
                                        .background(Color(.systemGray5))
                                        .clipShape(ChatBubble(isFromCurrentUser: message.isCurrentUser))
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
