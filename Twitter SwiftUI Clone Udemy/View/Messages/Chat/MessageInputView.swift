//
//  MessageInputView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/03.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(.plain)
                .frame(minHeight: 20)
            
            Button {
                
            } label: {
                Text("Send")
            }
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("Message"))
    }
}
