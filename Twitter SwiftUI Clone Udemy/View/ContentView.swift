//
//  ContentView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/01.
//

import SwiftUI

import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        
                        ConversationView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                viewModel.signOut()
                            } label: {
                                KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(16)
                            }
                        }
                    }
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
