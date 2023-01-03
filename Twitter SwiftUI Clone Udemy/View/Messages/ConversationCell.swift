//
//  ConversationCell.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/02.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("venom")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Longer messages text to see what happens when I do this.")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
                
                Spacer()
            }
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}

