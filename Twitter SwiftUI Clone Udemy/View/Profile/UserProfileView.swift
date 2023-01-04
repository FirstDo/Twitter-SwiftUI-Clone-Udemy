//
//  UserProfileView.swift
//  Twitter SwiftUI Clone Udemy
//
//  Created by dudu on 2023/01/04.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
