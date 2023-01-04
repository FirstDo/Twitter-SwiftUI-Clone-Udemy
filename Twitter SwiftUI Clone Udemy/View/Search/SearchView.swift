//
//  SearchView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/01.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        NavigationLink(destination: UserProfileView()) {
                            UserCell()
                        }
                    }
                }
                .padding(.leading)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
