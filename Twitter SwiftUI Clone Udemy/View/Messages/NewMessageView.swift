//
//  NewMessageView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/04.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        Button {
                            show.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                startChat.toggle()
                            }
                            
                        } label: {
                            UserCell()
                        }
                    }
                }
                .padding(.leading)
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
