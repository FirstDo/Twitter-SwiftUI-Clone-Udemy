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
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView {
                VStack {
                    ForEach(viewModel.users) { user in
                        Button {
                            show.toggle()
  
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                startChat.toggle()
                            }
                            
                        } label: {
                            UserCell(user: user)
                        }
                    }
                }
                .padding(.leading)
            }
        }
    }
}
