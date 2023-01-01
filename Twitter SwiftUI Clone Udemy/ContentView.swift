//
//  ContentView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                Text("Feed View")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                Text("Search View")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                Text("Message View")
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
